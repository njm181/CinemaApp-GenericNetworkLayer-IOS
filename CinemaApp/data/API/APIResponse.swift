//
//  APIResponse.swift
//  CinemaApp
//
//  Created by Nico Molina on 07/06/2024.
//

import Foundation

// Define the API response type. This type should typically include properties for the status, message, and the data returned from the API

struct APIResponse<T: Codable>: Codable {
    let status: APIResponseStatus?
    let message: String?
    let data: T?
}

enum APIResponseStatus: String, Codable {
    case success = "success"
    case error = "error"
    case clientError = "clientError"
    case errorUnknown = "errorUnknown"
    case serverError = "serverError"
    case errorInUrl = "errorInUrl"
    case errorDecoding = "errorDecoding"
    case errorWithoutType = "errorWithoutType"
    case errorCreateRequest = "errorCreateRequest"
}
