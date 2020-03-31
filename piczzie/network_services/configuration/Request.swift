//
//  Request.swift
//  piczzie
//
//  Created by Thomas on 30/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation


func validate(_ data: Data, _ response: URLResponse) throws -> Data {
    guard let httpResponse = response as? HTTPURLResponse else {
        throw ErrorNetwork.invalidResponse
    }
    guard (200..<300).contains(httpResponse.statusCode) else {
        throw ErrorNetwork.statusCode(httpResponse.statusCode)
    }
    return data
}

func postConfiguration<T: Codable>(router: Router,path: [String: Any]?, body: T) throws -> URLRequest {
    let headers = [
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "bearer \(String(describing: getToken()))"
    ]
    
    var pathWithParameters: String? = nil
       
       path?.forEach{ key, name  in
           pathWithParameters = router.path.replacingOccurrences(of: "{\(key)}", with: String(describing: name))
       }
       
       var urlComponents = URLComponents()
       urlComponents.scheme = "http"
       urlComponents.host = (endpoint)
       urlComponents.port = (port)
       urlComponents.path = pathWithParameters ?? router.path
       
    let encoder = JSONEncoder()
    guard let postData = try? encoder.encode(body) else {
           throw ErrorNetwork.invalidBody
    }
    
    guard let url = urlComponents.url else {
        throw ErrorNetwork.invalidEndpoint
    }
   
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = postData
    return request
}

func post<T:Codable>(url: Router, path: [String: Any]?, body: T, session: URLSession = URLSession.shared) throws -> URLSession.DataTaskPublisher {
    let request = try postConfiguration(router: url, path: path, body: body)
    return session.dataTaskPublisher(for: request)
}


func getRequestConfiguration(router: Router, path: [String: Any]?, queryParameter: [URLQueryItem]?)  throws -> URLRequest {
    let headers = [
         "Content-Type": "application/json",
         "Accept": "application/json",
         "Authorization": "bearer \(String(describing: getToken() ?? ""))"
     ]
    
    var pathWithParameters: String? = nil
    
    path?.forEach{ key, name  in
        pathWithParameters = router.path.replacingOccurrences(of: "{\(key)}", with: String(describing: name))
    }
    
    var urlComponents = URLComponents()
    urlComponents.queryItems = queryParameter
    urlComponents.scheme = "http"
    urlComponents.host = (endpoint)
    urlComponents.port = (port)
    urlComponents.path = pathWithParameters ?? router.path
    
    guard let url = urlComponents.url else {
         throw ErrorNetwork.invalidEndpoint
     }
   
     var request = URLRequest(url: url)
     request.httpMethod = "GET"
     request.allHTTPHeaderFields = headers
    
     return request
}

func get(url: Router, path: [String: Any]?, queryParameter: [URLQueryItem]?, session: URLSession = URLSession.shared) throws -> URLSession.DataTaskPublisher {
    let request = try getRequestConfiguration(router: url, path: path, queryParameter: queryParameter)
    return session.dataTaskPublisher(for: request)
}
