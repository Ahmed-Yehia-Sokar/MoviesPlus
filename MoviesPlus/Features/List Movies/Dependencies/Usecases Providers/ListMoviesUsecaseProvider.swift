//
//  ListMoviesUsecaseProvider.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import Foundation

class ListMoviesUsecaseProvider {
    static func getListMoviesUsecase() -> ListMoviesUsecase {
        let moviesServices = MoviesServicesProvider.getMoviesServices()
        return ListMoviesUsecase(moviesServices: moviesServices)
    }
}
