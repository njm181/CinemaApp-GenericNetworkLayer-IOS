//
//  Movie.swift
//  CinemaApp
//
//  Created by Nico Molina on 11/06/2024.
//

import Foundation

struct Movie: Codable {
    let dates: Date?
    let movieDetail: [MovieDetail]?
}
