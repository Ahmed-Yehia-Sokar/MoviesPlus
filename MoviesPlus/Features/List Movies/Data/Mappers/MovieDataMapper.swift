//
//  MovieDataMapper.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import Foundation

class MovieDataMapper {
    // MARK: - methods
    static func map(getMoviesResponse response: Any) -> [Movie] {
        var result = [Movie]()
        guard let responseAsDic = response as? [String: Any],
              let photosDic = responseAsDic["photos"] as? [String: Any],
              let moviesList = photosDic.getArray("photo") as? [[String: Any]] else {
            return result
        }
        
        for movie in moviesList {
            let id = movie.getString("id")
            let owner = movie.getString("owner")
            let secret = movie.getString("secret")
            let server = movie.getString("server")
            let title = movie.getString("title")
            let farm = movie.getInt("farm")
            let isPublic = movie.getInt("ispublic")
            let isFriend = movie.getInt("isfriend")
            let isFamily = movie.getInt("isfamily")
            let imageUrl = "http://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
            let movie = Movie(id: id,
                              owner: owner,
                              secret: secret,
                              server: server,
                              title: title,
                              farm: farm,
                              isPublic: isPublic,
                              isFriend: isFriend,
                              isFamily: isFamily,
                              imageUrl: imageUrl)
            
            result.append(movie)
        }
        
        return result
    }
}
