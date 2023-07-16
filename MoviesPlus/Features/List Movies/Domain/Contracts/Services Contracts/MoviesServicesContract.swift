//
//  MoviesServicesContract.swift
//  iMovies
//
//  Created by admin on 14/07/2023.
//

import Foundation

protocol MoviesServicesContract {
    func getMovies(forQuery query: String,
                   page: Int,
                   completionHandler: @escaping ([Movie]) -> Void,
                   errorHandler: @escaping (String) -> Void)
}
