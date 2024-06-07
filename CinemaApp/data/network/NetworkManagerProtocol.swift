//
//  NetworkManagerProtocol.swift
//  CinemaApp
//
//  Created by Nico Molina on 07/06/2024.
//

//The NetworkManager protocol defines a method for sending HTTP requests and receiving responses asynchronously. Here's a brief overview of the protocol:
import Foundation

protocol NetworkManagerProtocol {
    func createRequest<T: Decodable>(
        _ endpoint: EndpointProtocol,
        responseType: T.Type
    ) async throws -> T
}

//createRequest: his method sends an HTTP request using the provided EndpointProtocol and expects a response of a specified type T. It uses Swift's async/await for asynchronous execution and can throw errors in case of failures.
