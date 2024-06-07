//
//  HttpResponseStatus.swift
//  CinemaApp
//
//  Created by Nico Molina on 09/06/2024.
//

import Foundation

enum HttpResponseStatus {
    static let ok = 200...299
    static let clienteError = 400...499
    static let serverError = 500...599
}
