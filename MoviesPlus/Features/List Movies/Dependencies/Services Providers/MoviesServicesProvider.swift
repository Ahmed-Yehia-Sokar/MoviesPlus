//
//  MoviesServicesProvider.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import Foundation

class MoviesServicesProvider {
    static func getMoviesServices() -> MoviesServices {
        let apiClient = ApiClient()
        return MoviesServices(apiClient: apiClient)
    }
}
