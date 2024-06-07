//
//  Exception.swift
//  CinemaApp
//
//  Created by Nico Molina on 15/06/2024.
//

import Foundation

enum AppUIState: Error {
    case serverError(String)
    case networkingError(String)
    case unknownError(String)
    case custom(String)

    init(apiStatus: APIResponseStatus?, message: String?) {
        let defaultMessage = message ?? "Unknown error"
        switch apiStatus {
        case .serverError:
            self = .serverError(defaultMessage)
        case .clientError, .errorCreateRequest, .errorDecoding, .errorInUrl, .error, .errorWithoutType:
            self = .networkingError(defaultMessage)
        case .errorUnknown:
            self = .unknownError(defaultMessage)
        default:
            self = .custom(defaultMessage)
        }
    }
}

