//
//  ListMoviesViewController.swift
//  MoviesPlus
//
//  Created by admin on 16/07/2023.
//

import UIKit

class ListMoviesViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - properties
    private let listMoviesViewModel = ListMoviesViewModelProvider.getListMoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.isHidden = true
        
        listMoviesViewModel.dataSource.bind { [weak self] dataSource in
            guard let unwrappedSelf = self else { return }
            if let dataSource = dataSource, dataSource.isEmpty {
                unwrappedSelf.emptyView.isHidden = false
            } else {
                unwrappedSelf.activityIndicatorView.isHidden = true
                unwrappedSelf.emptyView.isHidden = true
                unwrappedSelf.activityIndicatorView.stopAnimating()
                unwrappedSelf.tableView.reloadData()
            }
        }
    }
    
    // MARK: - private methods
    private func listMoviesErrorHandler(errorMessage: String) {
        activityIndicatorView.isHidden = true
        activityIndicatorView.stopAnimating()
        
        let alert = UIAlertController(title: "Error",
                                      message: errorMessage,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ListMoviesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            listMoviesViewModel.resetPagination()
        }
        if listMoviesViewModel.getMediaItemsCount() == 0 {
            emptyView.isHidden = false
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        
        listMoviesViewModel.listMovies(forQuery: searchText,
                                       errorHandler: listMoviesErrorHandler)
    }
}

extension ListMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mediaItem = listMoviesViewModel.getMediaItem(atIndexPath: indexPath)
        let mediaType = listMoviesViewModel.getMediaType(mediaItem: mediaItem)

        if mediaType != .adBanner {
            if let selectedMovie = listMoviesViewModel.map(mediaItem: mediaItem) {
                if let displayMovieDetailsVC = storyboard?.instantiateViewController(withIdentifier: "DisplayMovieDetailsViewController") as? DisplayMovieDetailsViewController{
                    let displayMovieDetailsVM = DisplayMovieDetailsViewModel(selectedMovie: selectedMovie)
                    
                    displayMovieDetailsVC.initViewController(withViewModel: displayMovieDetailsVM)
                    navigationController?.pushViewController(displayMovieDetailsVC, animated: true)
                }
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > (tableView.contentSize.height - 50) - (scrollView.frame.size.height) {
            guard let searchText = searchBar.text else { return }
            guard !listMoviesViewModel.isPaginationOn else { return }
            
            listMoviesViewModel.listMovies(forQuery: searchText,
                                           isPaginationOn: true,
                                           errorHandler: listMoviesErrorHandler)
        }
    }
}

extension ListMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listMoviesViewModel.getMediaItemsCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let mediaItem = listMoviesViewModel.getMediaItem(atIndexPath: indexPath)
        let mediaType = listMoviesViewModel.getMediaType(mediaItem: mediaItem)
        
        if mediaType == .adBanner {
            return 60.0
        }
        
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mediaItem = listMoviesViewModel.getMediaItem(atIndexPath: indexPath)
        let mediaType = listMoviesViewModel.getMediaType(mediaItem: mediaItem)

        if mediaType == .adBanner {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AdBannerTableCell", for: indexPath) as? AdBannerTableCell else {
                return AdBannerTableCell()
            }
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableCell", for: indexPath) as? MovieTableCell else {
            return MovieTableCell()
        }
        guard let movie = listMoviesViewModel.map(mediaItem: mediaItem) else {
            return MovieTableCell()
        }
        let validUrl = listMoviesViewModel.getValidURL(urlString: movie.imageUrl)
        cell.configureCell(withURL: validUrl, id: movie.id)
        return cell
    }
}
