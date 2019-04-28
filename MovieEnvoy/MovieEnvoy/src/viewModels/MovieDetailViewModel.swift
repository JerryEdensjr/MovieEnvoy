//
//  MovieDetailViewModel.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/28/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailViewModelDelegate: AnyObject {
  func didUpdateMovieDetail()
}

final class MovieDetailViewModel: NSObject {

  // MARK: - properties
  weak var delegate: MovieDetailViewModelDelegate?

  // MARK: - configuration
  func configure(with movie: MovieSummary) {
  }

}

extension MovieDetailViewModel: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    fatalError()
  }

}
