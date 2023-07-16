//
//  MoviesServices.swift
//  iMovies
//
//  Created by admin on 14/07/2023.
//

import Foundation

class MoviesServices: MoviesServicesContract {
    // MARK: - properties
    private var apiClient: ApiClient,
                getMoviesCompletionHandler: (([Movie]) -> Void)?,
                getMoviesErrorHandler: ((String) -> Void)?
    
    // MARK: - public methods
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getMovies(forQuery query: String,
                   page: Int,
                   completionHandler: @escaping ([Movie]) -> Void,
                   errorHandler: @escaping (String) -> Void) {
        getMoviesCompletionHandler = completionHandler
        getMoviesErrorHandler = errorHandler
        
        let getMoviesApi = MoviesApiRouter.getMovies(query: query, page: page)
        
        apiClient.performRequest(url: getMoviesApi.path,
                                 parameters: getMoviesApi.parameters,
                                 method: getMoviesApi.method,
                                 successHandler: getMoviesSuccessHandler,
                                 errorHandler: getMoviesErrorHandler)
    }
    
    // MARK: - private methods
    private func getMoviesSuccessHandler(response: Any) {
        let moviesList = MovieDataMapper.map(getMoviesResponse: response)
        getMoviesCompletionHandler?(moviesList)
    }
    
    private func getMoviesErrorHandler(exception: ApiException) {
        let errorMessage = exception.description
        getMoviesErrorHandler?(errorMessage)
    }
}
