//
//  ServiceLayer.swift
//  piczzie
//
//  Created by Thomas on 27/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

class ServiceLayer {

    class func request<T: Codable>(router: Router ,data: T, completion: @escaping (Result<T, ErrorNetwork>) -> ()) {
   
    let url = URL(string: (endpoint)+router.path)
        
    guard let requestUrl = url else { fatalError() }

    var request = URLRequest(url: requestUrl)
      

    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("bearer \(String(describing: getToken()))", forHTTPHeaderField: "Authorization")

    request.httpBody = try! JSONEncoder().encode(data)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else {
            completion(.failure(.emptyData))
            return
        }
        
        let status = (response as! HTTPURLResponse).statusCode
        if(HandleErrorNetwork.handleCodeStatut(statusCode: status) != nil){
            completion(.failure(HandleErrorNetwork.handleCodeStatut(statusCode: status)!))
            return
        }
        
        guard let data = data else {
            return
        }
            
            let responseObject = try! JSONDecoder().decode(T.self, from: data)
        DispatchQueue.main.async {
            completion(.success(responseObject))
        }
    }
        dataTask.resume()
    }
}
