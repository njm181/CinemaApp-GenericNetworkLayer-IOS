//
//  ResultDTO.swift
//  CinemaApp
//
//  Created by Nico Molina on 07/06/2024.
//

import Foundation

// MARK: - Result
struct ResultDTO: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension ResultDTO {
    func toDomain() -> MovieDetail {
        return .init(adult: adult, backdropPath: backdropPath, genreIDS: genreIDS, id: id, originalLanguage: originalLanguage, originalTitle: originalTitle, overview: overview, popularity: popularity, posterPath: posterPath, releaseDate: releaseDate, title: title, voteAverage: voteAverage, voteCount: voteCount)
    }
}
