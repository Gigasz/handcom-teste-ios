//
//  REST.swift
//  Handcom-Sales app
//
//  Created by Arthur Valle on 01/03/2018.
//  Copyright © 2018 Arthur Valle. All rights reserved.
//

import Foundation

enum RequestError {
    case url
    case taskError(error: NSError)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class REST {
    private static let basePath = "http://homolog.smartretail.com.br/api/encartes/web?empresa=20"

    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()

    private static let session = URLSession(configuration: configuration) //URLSession.shared

    class func get(onComplete: @escaping (Results) -> Void, onError: @escaping (RequestError) -> Void) {
        guard let url = URL(string: basePath) else {
            onError(.url)
            return
        }

        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in

            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {return}
                    
                    do {
                        let result = try JSONDecoder().decode(Results.self, from: data)
                        onComplete(result)

                    } catch {
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }

                } else {
                    print("Status inválido")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error! as NSError))
            }

        }

        dataTask.resume()
    }
}
//
//class REST() {
//    private static let basepath = "http://homolog.smartretail.com.br/api/encartes/web?empresa=20"
//    
//    private static let configuration: URLSessionConfiguration = {
//        let config = URLSessionConfiguration.default
//        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
//        config.timeoutIntervalForRequest = 30.0
//        config.httpMaximumConnectionsPerHost = 5
//        return config
//    }()
//    
//    private static let session = URLSession(configuration: configuration)
//    
//    guard let url = URL(string: basepath) else {return}
//    
//    let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
//        
//        if error == nil {
//            
//            guard let response = response as? HTTPURLResponse else {return}
//            
//            if response.statusCode == 200 {
//                guard let data = data else {return}
//                do {
//                    
//                    let sales = try JSONDecoder().decode(Results.self, from: data)
//                    dump(sales)
//                    self.sales = sales
//                    
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                    
//                } catch {
//                    print("1")
//                    print(error.localizedDescription)
//                }
//                
//            } else {
//                print("Invalid Request")
//            }
//            
//        } else {
//            print("2")
//            print(error!)
//        }
//    }
//    dataTask.resume()
//}

