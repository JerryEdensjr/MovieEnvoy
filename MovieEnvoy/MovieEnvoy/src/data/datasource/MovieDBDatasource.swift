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
  func refreshMovieList(with endpoint: APIEndpoint, completion: @escaping (([Movie]) -> Void)) {
    switch endpoint {
    case .nowPlaying:
      APIService.shared.getMoviesNowPlaying { (result) in
        switch result {
        case let .success(movies):
            completion(movies)
        case let .failure(error):
          print(items: error.localizedDescription)
          completion([Movie]())
        }
      }

    case .popular:
      APIService.shared.getPopularMovies { (result) in
        switch result {
        case let .success(movies):
          completion(movies)
        case let .failure(error):
          print(items: error.localizedDescription)
          completion([Movie]())
        }
      }
    case .topRated:
      APIService.shared.getTopRatedMovies { (result) in
        switch result {
        case let .success(movies):
          completion(movies)
        case let .failure(error):
          print(items: error.localizedDescription)
          completion([Movie]())
        }
      }
    case .upcoming:
      APIService.shared.getUpcomingMovies { (result) in
        switch result {
        case let .success(movies):
          completion(movies)
        case let .failure(error):
          print(items: error.localizedDescription)
          completion([Movie]())
        }
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
      cell.posterImageView.af_setImage(withURL: URL(string: APIService.context.imageBaseURLString + movie.posterPath)!)
      return cell
    }

    return UITableViewCell()
  }
}
