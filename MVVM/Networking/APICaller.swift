import UIKit

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    static func getTrendingMovies(completionHandler: @escaping(_ result: Result<TrendingMovieModel, NetworkError>) -> Void)  {
        let urlString = NetworkConstant.shared.serverAddress + "?apikey=" + NetworkConstant.shared.apiKey + "&s=horrors"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponce, urlResponce, error in
            if error == nil,
               let data = dataResponce,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
