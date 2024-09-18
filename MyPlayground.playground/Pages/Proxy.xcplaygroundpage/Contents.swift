//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


//The Proxy Design Pattern is a structural design pattern that provides a surrogate or placeholder object, which controls access to another object. The proxy typically handles access to the real object by performing some additional operations (such as lazy initialization, access control, logging, caching, etc.) before passing the request to the actual object.


//How It Works:

//Client: The client interacts with the proxy as if it were the real object.
//Proxy: The proxy implements the same interface as the real object and controls access to it. It can perform additional operations like caching, logging, etc.
//Real Subject (Real Object): This is the actual object that the proxy controls access to. It performs the real operations requested by the client.



public class Networking {
    
    // MARK: - Initializers
    
    public init() {
        // Set up of the class
    }
    
    // MARK: - API methods
    
    public func dataTask(for url: URL, completion: @escaping (URLResponse?) -> ()) {
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            completion(response)
        }
        session.resume()
    }
    
}

// Implementing Proxy

public class BackendNetworkingProxy {
    
    public enum DataUpdateStatus {
        case success
        case delayed
        case error
        case uncategorized
    }
    
    // MARK: - Properties
    
    private var url = URL(string: "http://www.ourbackend.com/data-update/")!
    private(set) var networking: Networking
    
    // MARK: - Initializers
    
    public init() {
        networking = Networking()
    }
    
    // MARK: - Methods
    
    public func requestDataUpdate(completion: @escaping (DataUpdateStatus?)->()) {
        
        networking.dataTask(for: url) { response in
            guard let uresponse = response as? HTTPURLResponse else {
                completion(nil)
                return
            }
            
            switch uresponse.statusCode {
            case 200...203: // does not repesent actual status code handling, for demonstration purposes only
                completion(.success)
            case 735: // does not repesent actual status code handling, for demonstration purposes only
                completion(.delayed)
            case 400...600: // does not repesent actual status code handling, for demonstration purposes only
                completion(.error)
            default:
                completion(.uncategorized)
            }
        }
    }
}


