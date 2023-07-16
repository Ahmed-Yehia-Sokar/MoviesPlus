//
//  ListMoviesUsecaseContract.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import Foundation

protocol ListMoviesUsecaseContract {
    func getMovies(forQuery query: String,
                   page: Int,
                   completionHandler: @escaping ([Movie]) -> Void,
                   errorHandler: @escaping (String) -> Void)
}
