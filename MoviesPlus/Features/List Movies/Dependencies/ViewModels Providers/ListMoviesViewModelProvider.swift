//
//  ListMoviesViewModelProvider.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import Foundation

class ListMoviesViewModelProvider {
    static func getListMoviesViewModel() -> ListMoviesViewModel {
        let listMoviesUsecase = ListMoviesUsecaseProvider.getListMoviesUsecase()
        return ListMoviesViewModel(listMoviesUsecase: listMoviesUsecase)
    }
}
