//
//  EndpointProtocol.swift
//  CinemaApp
//
//  Created by Nico Molina on 07/06/2024.
//

import Foundation
//This protocol defines the structure for creating network request endpoints. It includes properties like baseURL, path, method, header, queryParams, and multipartFormData, allowing you to specify various details of an API endpoint.

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
//   var method: HTTPMethod { get }
//    var header: [String: String]? { get }
//    var queryParams: [String: Any]? { get }
}

extension EndpointProtocol {
    
    func makeUrlRequest() -> URLRequest {
        guard var components = URLComponents(string: baseUrl) else { fatalError("Invalid base URL") }
        
        // Add path
        components.path += path
        print(components.url)
        
        // Create request
        var request = URLRequest(url: components.url!)
        //request.httpMethod = method.rawValue
        
        // Add queryParams
//        if let queryParams = queryParams {
//            if method == .GET {
//                // For GET requests, append query parameters to the URL
//                
//                var queryItems: [URLQueryItem] = []
//                for (key, value) in queryParams {
//                    let queryItem = URLQueryItem(name: key, value: String(describing: value))
//                    queryItems.append(queryItem)
//                }
//                components.queryItems = queryItems
//                print(components.url)
//                request.url = components.url
//                
//            } else {
//                // For other methods, add query parameters to the request body
//                do {
//                    let data = try JSONSerialization.data(withJSONObject: queryParams)
//                    request.httpBody = data
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
        
        //Add header
//        if let header = header {
//            for (key, value) in header {
//                request.setValue(value, forHTTPHeaderField: key)
//            }
//        }
        
        return request
    }
}
