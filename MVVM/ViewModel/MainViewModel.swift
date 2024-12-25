import UIKit

final class MainViewModel {
    
    func numberOfSections() -> Int {
       1
    }
    
    func numberOfRows(in section: Int) -> Int {
        10
    }
    
    func getData() {
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Tap Trending Count: \(data.search.count)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
