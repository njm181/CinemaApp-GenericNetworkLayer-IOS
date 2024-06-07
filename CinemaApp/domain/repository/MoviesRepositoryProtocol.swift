//
//  MoviesServiceProtocol.swift
//  CinemaApp
//
//  Created by Nico Molina on 07/06/2024.
//

import Foundation

// This protocol will allow you to use mock data for testing and make your project more testable.

protocol MoviesRepositoryProtocol {
    func getCurrentMovies() async throws -> APIResponse<Movie>
}
