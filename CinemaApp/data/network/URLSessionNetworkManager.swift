//
//  URLSessionNetworkManager.swift
//  CinemaApp
//
//  Created by Nico Molina on 08/06/2024.
//

import Foundation

//The URLSessionNetworkManager class is an implementation of the NetworkManager protocol. It uses Apple's URLSession to perform network operations. Here's an explanation of the class:

class URLSessionNetworkManager: NetworkManagerProtocol {
    
    static let shared = URLSessionNetworkManager()
    
    func createRequest<T: Decodable>(_ endpoint: EndpointProtocol, responseType: T.Type) async throws -> T {
        
        // Create an HTTP request using the provided endpoint
        let urlRequest = endpoint.makeUrlRequest()
        return try await makeRequest(urlRequest: urlRequest)
    }
    
    private func makeRequest<T: Decodable>(urlRequest: URLRequest) async throws -> T {
        let request = try await URLSession.shared.data(for: urlRequest)
        return try validateResponse(request: request)
    }
    
    private func validateResponse<T: Decodable>(
        request: (data: Data, httpResponse: URLResponse)
    ) throws -> T {
        
        guard let httpResponse = request.httpResponse as? HTTPURLResponse
        else {
            throw ApiError.unknownError
        }
        
        switch httpResponse.statusCode {
        case HttpResponseStatus.ok:
            return try decodeModel(data: request.data)
        case HttpResponseStatus.clienteError:
            throw ApiError.clientError
        case HttpResponseStatus.serverError:
            throw ApiError.serverError
        default:
            throw ApiError.unknownError
        }
    }
    
    private func decodeModel<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        let model = try? decoder.decode(T.self, from: data)
        guard let model = model else {
            print("ERROR DECODING")
            throw ApiError.errorDecoding
        }
        return model
    }
        
}
