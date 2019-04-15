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
  private var viewModel = MovieViewModel()

  // MARK: overrides
  private override init() {
  }

  var movies: [Movie] {
    return viewModel.movies
  }

  // MARK: utilities
  func refreshMovieList(with endpoint: APIEndpoint, completion: @escaping (() -> Void)) {
    viewModel.getMovies(with: endpoint, completion: completion)
  }

}

extension MovieDBDatasource: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.movies.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.cellIdentifier()) as? MovieInfoTableViewCell {
      let movie = self.movies[indexPath.row]
      cell.configure(with: movie)
      return cell
    }

    return UITableViewCell()
  }
}
