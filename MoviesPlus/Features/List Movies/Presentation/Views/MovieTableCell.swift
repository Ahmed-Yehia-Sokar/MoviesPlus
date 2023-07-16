//
//  MovieTableCell.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import UIKit
import AlamofireImage

class MovieTableCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var coverImageView: UIImageView!
    
    // MARK: - public methods
    func configureCell(withURL url: URL?, id: String) {
        if let validUrl = url {
            coverImageView.af.setImage(withURL: validUrl,
                                       cacheKey: id,
                                       placeholderImage: UIImage(named: "placeholder-image"))
        }
    }
}
