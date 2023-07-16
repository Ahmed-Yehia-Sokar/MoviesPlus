//
//  DisplayMovieDetailsViewModelProvider.swift
//  MoviesPlus
//
//  Created by admin on 16/07/2023.
//

import Foundation

class DisplayMovieDetailsViewModelProvider {
    static func getDisplayMovieDetailsViewModel(withMovie selectedMovie: Movie) -> DisplayMovieDetailsViewModel {
        return DisplayMovieDetailsViewModel(selectedMovie: selectedMovie)
    }
}
