//
//  DatesDTO.swift
//  CinemaApp
//
//  Created by Nico Molina on 07/06/2024.
//

import Foundation

// MARK: - Dates
struct DatesDTO: Codable {
    let maximum, minimum: String?
}

extension DatesDTO {
    func toDomain() -> Date {
        return .init(maximum: maximum, minimum: minimum)
    }
}
