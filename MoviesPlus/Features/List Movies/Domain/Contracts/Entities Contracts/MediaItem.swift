//
//  MediaItem.swift
//  MoviesPlus
//
//  Created by admin on 16/07/2023.
//

import Foundation

enum MediaType {
    case adBanner
    case movie
}

protocol MediaItem {
    var mediaType: MediaType { get }
}
