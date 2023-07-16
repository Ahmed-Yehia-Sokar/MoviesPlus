//
//  MoviesApiRouter.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import Foundation
import Alamofire

enum MoviesApiRouter: ApiRouterContract {
    case getMovies(query: String,
                   page: Int)
    
    var method: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        }
    }
    var path: String {
        switch self {
        case .getMovies:
            return getMoviesApiRequestPath()
        }
    }
    var parameters: [String : Any] {
        switch self {
        case .getMovies(let query,
                        let page):
            return getMoviesApiRequestParameters(query: query, page: page)
        }
    }
}

extension MoviesApiRouter {
    private func getMoviesApiRequestPath() -> String {
        let path = "\(ApiConstants.webserviceUrl)/?method=flickr.photos.search"
        return path
    }
    
    private func getMoviesApiRequestParameters(query: String, page: Int) -> Parameters {
        var requestParameters = ApiConstants.defaultRequestParameters
        requestParameters["text"] = query
        requestParameters["page"] = page
        requestParameters["per_page"] = 20
        requestParameters["format"] = "json"
        requestParameters["nojsoncallback"] = 50
        return requestParameters
    }
}
