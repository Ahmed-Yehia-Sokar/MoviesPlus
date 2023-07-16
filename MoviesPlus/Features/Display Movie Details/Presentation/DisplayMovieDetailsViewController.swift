//
//  DisplayMovieDetailsViewController.swift
//  MoviesPlus
//
//  Created by admin on 16/07/2023.
//

import UIKit
import AlamofireImage

class DisplayMovieDetailsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var coverImageView: UIImageView!
    
    // MARK: - properties    
    private var displayMovieDetailsViewModel: DisplayMovieDetailsViewModel?

    // MARK: - public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let validUrl = displayMovieDetailsViewModel?.getValidURLForSelectedMovie() {
            coverImageView.af.setImage(withURL: validUrl,
                                       cacheKey: displayMovieDetailsViewModel?.selectedMovie.id,
                                       placeholderImage: UIImage(named: "placeholder-image"))
        }
    }
    
    func initViewController(withViewModel displayMovieDetailsViewModel: DisplayMovieDetailsViewModel) {
        self.displayMovieDetailsViewModel = displayMovieDetailsViewModel
    }
}
