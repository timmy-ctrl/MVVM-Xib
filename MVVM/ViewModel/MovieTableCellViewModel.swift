import UIKit

class MovieTableCellViewModel {
    var title: String
    var imageUrl: URL?
    
    init(movie: Search) {
        self.title = movie.title
        self.imageUrl = URL(string: movie.poster)
    }
    
//    private func makeImageUrl(_ imageCode: String) -> URL? {
//        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
//    }
}
