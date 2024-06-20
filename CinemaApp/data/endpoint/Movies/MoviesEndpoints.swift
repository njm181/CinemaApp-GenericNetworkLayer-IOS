//
//  MoviesEndpoints.swift
//  CinemaApp
//
//  Created by Nico Molina on 07/06/2024.
//

import Foundation
//create an enum implementing the EndpointProtocol to define your API endpoints

enum MoviesEndpoints {
    case getCurrentMovies
}

extension MoviesEndpoints: EndpointProtocol {
    
    var baseUrl: String {
        //"https://api.themoviedb.org/3/movie"
        "https://api.mockfly.dev/mocks/a2e39d35-6f55-418c-a234-ed4569485b53"
    }
    
    var path: String {
        switch self {
        case .getCurrentMovies:
            //return "/now_playing"
            return "/get-movies"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCurrentMovies:
            return .GET
        }
    }
    
    var header: [String : String]? {
        var header = ["Content-type": "application/json; charset=UTF-8"]
        return header
//        switch self {
//        case .getCurrentMovies:
//            header["Authorization"] = "Bearer"
//            return header
//        default:
//            return header
//        }
    }
    
    var queryParams: [String : Any]? {
        return nil
//        switch self {
//        case .getCurrentMovies:
//            return ["language": "en-US", "page": 1, "region":"AR"]
//        }
    }
}
