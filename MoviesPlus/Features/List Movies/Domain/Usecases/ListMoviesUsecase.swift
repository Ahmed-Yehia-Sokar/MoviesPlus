//
//  ListMoviesUsecase.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import Foundation

class ListMoviesUsecase: ListMoviesUsecaseContract {
    // MARK: - properties
    private let moviesServices: MoviesServicesContract
    
    // MARK: - public methods
    init(moviesServices: MoviesServicesContract) {
        self.moviesServices = moviesServices
    }
    
    func getMovies(forQuery query: String,
                   page: Int,
                   completionHandler: @escaping ([MediaItem]) -> Void,
                   errorHandler: @escaping (String) -> Void) {
        moviesServices.getMovies(forQuery: query,
                                 page: page,
                                 completionHandler: completionHandler,
                                 errorHandler: errorHandler)
    }
}
