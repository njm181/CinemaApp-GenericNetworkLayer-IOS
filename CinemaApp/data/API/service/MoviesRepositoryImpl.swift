//
//  MoviesServiceImpl.swift
//  CinemaApp
//
//  Created by Nico Molina on 07/06/2024.
//

import Foundation

//Customize the YourRealService class by implementing the functions defined in YourServiceProtocol.
class MoviesRepositoryImpl: MoviesRepositoryProtocol {
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getCurrentMovies() async throws -> APIResponse<Movie> {
        let endpoint = MoviesEndpoints.getCurrentMovies
        
        do {
            let result = try await networkManager.createRequest(endpoint, responseType: MoviesDTO.self)
            
            if let moviesDTO = result as? MoviesDTO {
                return APIResponse(status: .success, message: "Success", data: moviesDTO.toDomain())
            } else {
                if let apiError = result as? ApiError {
                    switch apiError {
                    case .unknownError:
                        return APIResponse(status: .errorUnknown, message: apiError.errorDescription, data: nil)
                    case .clientError:
                        return APIResponse(status: .clientError, message: apiError.errorDescription, data: nil)
                    case .serverError:
                        return APIResponse(status: .serverError, message: apiError.errorDescription, data: nil)
                    case .errorInUrl:
                        return APIResponse(status: .errorInUrl, message: apiError.errorDescription, data: nil)
                    case .errorDecoding:
                        return APIResponse(status: .errorDecoding, message: apiError.errorDescription, data: nil)
                    }
                } else {
                    return APIResponse(status: .errorWithoutType, message: "Unknown Error", data: nil)
                }
            }
        } catch {
            return APIResponse(status: .errorCreateRequest, message: "Error: \(error)", data: nil)
        }
    }
    
    
}
