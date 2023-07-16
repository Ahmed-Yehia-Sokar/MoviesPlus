//
//  Movie.swift
//  iMovies
//
//  Created by admin on 14/07/2023.
//

import Foundation

struct Movie: MediaItem {
    // MARK: - properties
    let id: String,
        owner: String,
        secret: String,
        server: String,
        title: String,
        farm: Int,
        isPublic: Int,
        isFriend: Int,
        isFamily: Int,
        imageUrl: String
    var mediaType: MediaType {
        .movie
    }
}
