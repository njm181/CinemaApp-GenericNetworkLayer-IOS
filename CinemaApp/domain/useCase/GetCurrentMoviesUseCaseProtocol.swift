//
//  GetCurrentMoviesUseCaseProtocol.swift
//  CinemaApp
//
//  Created by Nico Molina on 12/06/2024.
//

import Foundation
import Combine

protocol GetCurrentMoviesUseCaseProtocol {
    func execute() -> AnyPublisher<Movie, AppUIState>
}
