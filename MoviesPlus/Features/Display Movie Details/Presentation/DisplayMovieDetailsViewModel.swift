//
//  DisplayMovieDetailsViewModel.swift
//  MoviesPlus
//
//  Created by admin on 16/07/2023.
//

import Foundation

class DisplayMovieDetailsViewModel {
    // MARK: - properties
    let selectedMovie: Movie
    
    // MARK: - methods
    init(selectedMovie: Movie) {
        self.selectedMovie = selectedMovie
    }
    
    func getValidURLForSelectedMovie() -> URL? {
        if let validUrl = URL(string: selectedMovie.imageUrl) {
            return validUrl
        }
        return nil
    }
}
