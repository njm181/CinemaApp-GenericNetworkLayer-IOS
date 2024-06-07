//
//  MovieViewModel.swift
//  CinemaApp
//
//  Created by Nico Molina on 15/06/2024.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    
    @Published var movie: Movie?
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let movieUseCase: GetCurrentMoviesUseCaseProtocol
    
    init(movieUseCase: GetCurrentMoviesUseCaseProtocol) {
        self.movieUseCase = movieUseCase
    }
    
    
    func fetchMovies(){
        movieUseCase.execute()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.handleError(error)
                }
            } receiveValue: { movie in
                self.movie = movie
            }
            .store(in: &cancellables)

    }
    
    private func handleError(_ error: AppUIState){
        switch error {
        case .serverError(let message),
             .networkingError(let message),
             .unknownError(let message),
             .custom(let message):
            self.errorMessage = message
        }
    }
}
