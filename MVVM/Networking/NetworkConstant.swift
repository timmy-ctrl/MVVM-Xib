import UIKit

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()

    public var apiKey: String {
        get {
            return "4238c8e0"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://www.omdbapi.com/"
        }
    }

    private init() {
        
    }

}
