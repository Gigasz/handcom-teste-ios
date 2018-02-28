//
//  RequestController.swift
//  Handcom-Sales app
//
//  Created by Arthur Valle on 28/02/2018.
//  Copyright © 2018 Arthur Valle. All rights reserved.
//

import Foundation

class RequestController {
    private static let basepath = "http://homolog.smartretail.com.br/api/encartes/web?empresa=20"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func loadSales() {
        guard let url = URL(string: basepath) else {return}
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                
                guard let response = response as? HTTPURLResponse else {return}
                
                if response.statusCode == 200 {
                    guard let data = data else {return}
                    do {
                        
                        let sales = try JSONDecoder().decode(Results.self, from: data)
                        dump(sales)
                        
                    } catch {
                        print("1")
                        print(error.localizedDescription)
                    }
                    
                } else {
                    print("Invalid Request")
                }
                
            } else {
                print("2")
                print(error!)
            }
        }
        
        dataTask.resume()
    }
}

