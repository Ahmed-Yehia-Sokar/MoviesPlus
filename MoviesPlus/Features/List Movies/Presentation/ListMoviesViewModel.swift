//
//  ListMoviesViewModel.swift
//  MoviesPlus
//
//  Created by admin on 16/07/2023.
//

import Foundation

class ListMoviesViewModel {
    // MARK: - properties
    private let listMoviesUsecase: ListMoviesUsecaseContract
    private var currentPage = 1
    private(set) var isPaginationOn = false
    private(set) var dataSource = Bindable<[MediaItem]>()
    
    // MARK: - public methods
    init(listMoviesUsecase: ListMoviesUsecaseContract) {
        self.listMoviesUsecase = listMoviesUsecase
    }
    
    func listMovies(forQuery query: String,
                    isPaginationOn: Bool = false,
                    errorHandler: @escaping (String) -> Void) {
        if isPaginationOn {
            currentPage += 1
            self.isPaginationOn = true
        }
        
        listMoviesUsecase.getMovies(forQuery: query,
                                    page: currentPage) { [weak self] newMoviesList in
            guard let unwrappedSelf = self else { return }
            unwrappedSelf.handleIncomingMoviesList(moviesList: newMoviesList)
            unwrappedSelf.isPaginationOn = false
        } errorHandler: { errorMessage in
            errorHandler(errorMessage)
        }
    }
    
    func getMediaItemsCount() -> Int {
        dataSource.value?.count ?? 0
    }
    
    func getMediaItem(atIndexPath indexPath: IndexPath) -> MediaItem? {
        dataSource.value?[indexPath.row]
    }
    
    func getMediaType(mediaItem: MediaItem?) -> MediaType {
        mediaItem?.mediaType ?? .adBanner
    }
    
    func map(mediaItem: MediaItem?) -> Movie? {
        (mediaItem as? Movie)
    }
    
    func getValidURL(urlString: String) -> URL? {
        if let validUrl = URL(string: urlString) {
            return validUrl
        }
        return nil
    }
    
    func resetPagination() {
        currentPage = 1
        isPaginationOn = false
        dataSource.value?.removeAll()
    }
    
    // MARK: - private methods
    private func handleIncomingMoviesList(moviesList newMoviesList: [MediaItem]) {
        var updatedDataSource = dataSource.value ?? []
        
        for i in 0...(newMoviesList.count - 1) {
            if i != 0 && i % 5 == 0 {
                let adBanner = AdBanner()
                updatedDataSource.append(adBanner)
            }
            updatedDataSource.append(newMoviesList[i])
        }
        
        let adBanner = AdBanner()
        updatedDataSource.append(adBanner)
        
        dataSource.value = updatedDataSource
    }
}
