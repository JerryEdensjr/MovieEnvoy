//
//  MovieDBDatasource.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class MovieDBDatasource: NSObject {

  static let sharedInstance = MovieDBDatasource()

  // MARK: properties
  fileprivate var _movies = [Movie]()

  // MARK: overrides
  fileprivate override init() {
  }

  var movies: [Movie] {
    return self._movies
  }

  // MARK: utilities
  func refreshMovieList(with endpoint: Endpoint, completion: @escaping (([Movie]?) -> Void)) {
    let apiClient = APIClient.sharedInstance
    apiClient.request(endpoint) { (movies) in
      if let movies = movies {
        self._movies = movies
        completion(self._movies)

      } else {
        completion(nil)
      }
    }
  }
}

extension MovieDBDatasource: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.movies.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.cellIdentifier()) as? MovieInfoTableViewCell {
      let movie = self.movies[indexPath.row]
      cell.movieTitle.text = movie.title
      cell.overview.text = movie.overview
      cell.posterImageView.af_setImage(withURL: URL(string: Endpoint.image.path + movie.posterPath)!)
      return cell
    }

    return UITableViewCell()
  }
}
