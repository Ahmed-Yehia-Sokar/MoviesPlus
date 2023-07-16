//
//  ApiRouterContract.swift
//  iMovies
//
//  Created by admin on 14/07/2023.
//

import Foundation
import Alamofire

protocol ApiRouterContract {
    var headers: HTTPHeaders? { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters { get }
}

extension ApiRouterContract {
    var headers: HTTPHeaders? {
        nil
    }
    var method: HTTPMethod {
        .get
    }
    var path: String {
        ApiConstants.webserviceUrl
    }
    var parameters: Parameters {
        ApiConstants.defaultRequestParameters
    }
}
