//
//  ApiException.swift
//  iMovies
//
//  Created by admin on 14/07/2023.
//

import Foundation

struct ApiException: Error {
    // MARK: - properties
    private(set) var statusCode: ApiStatusCode,
                     description: String
    
    // MARK: - public methods
    init(statusCode: ApiStatusCode) {
        self.statusCode = statusCode
        self.description = statusCode.description
    }
}
