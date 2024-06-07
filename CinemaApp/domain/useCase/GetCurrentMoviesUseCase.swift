//
//  GetCurrentMoviesUseCase.swift
//  CinemaApp
//
//  Created by Nico Molina on 11/06/2024.
//

import Foundation
import Combine

//apply switch to filter status response and the different error types
final class GetCurrentMoviesUseCase: GetCurrentMoviesUseCaseProtocol {
    
    private let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<Movie, AppUIState> {
        
        return Future { promise in
            Task {
                do {
                    let response = try await self.repository.getCurrentMovies()
                    
                    if let status = response.status, status == .success, let movie = response.data {
                        promise(.success(movie))
                    } else {
                        throw AppUIState(apiStatus: response.status, message: response.message)
                    }
                } catch {
                    if let appUIStateError = error as? AppUIState {
                        promise(.failure(appUIStateError))
                    } else {
                        promise(.failure(AppUIState.custom(error.localizedDescription)))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    
    
}
