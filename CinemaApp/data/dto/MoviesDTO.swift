//
//  MoviesAPIResponse.swift
//  CinemaApp
//
//  Created by Nico Molina on 07/06/2024.
//

import Foundation

// MARK: - Movies ---- apply toDomain para eliminar propiedades innecesarias
struct MoviesDTO: Codable {
    let dates: DatesDTO?
    let page: Int?
    let results: [ResultDTO]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension MoviesDTO {
    func toDomain() -> Movie {
        return .init(
            dates: dates?.toDomain(),
            movieDetail: results?.map { $0.toDomain() }
        )
    }
}
