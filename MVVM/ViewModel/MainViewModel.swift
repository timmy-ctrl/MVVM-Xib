import UIKit

final class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSourse: TrendingMovieModel?
    
    func numberOfSections() -> Int {
       1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSourse?.search.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                self?.dataSourse = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSourse?.search.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Search) -> String {
        return movie.title
    }
    
    func retriveMovie(with title: String) -> Search? {
        guard let movie = dataSourse?.search.first(where: {$0.title == title}) else {
            return nil
        }
        return movie
    }
    
}


