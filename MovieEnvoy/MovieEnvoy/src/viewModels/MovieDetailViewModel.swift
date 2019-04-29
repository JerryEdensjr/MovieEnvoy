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
  var movieDetail: MovieDetail?
  private var movieSummary: MovieSummary?

  // MARK: - configuration
  func configure(with movieSummary: MovieSummary) {
    self.movieSummary = movieSummary
    APIService.shared.getMovieDetails(for: movieSummary.id) { [weak self] (result) in
      guard let self = self else { return }
      
      switch result {
      case .success(let movieDetail):
        self.movieDetail = movieDetail
        DispatchQueue.main.async {
          self.delegate?.didUpdateMovieDetail()
        }

      case .failure(let error):
        print(items: error.localizedDescription)
        DispatchQueue.main.async {
          self.delegate?.didUpdateMovieDetail()
        }
      }
    }
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

extension MovieDetailViewModel: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: MovieDetailHeaderView.identifier) as? MovieDetailHeaderView else {
      let view = UIView(); view.isHidden = true; view.frame = CGRect.zero; return view
    }

    if let movieDetail = self.movieDetail {
      view.update(with: movieDetail)
    } else if let movieSummary = self.movieSummary {
      view.configure(with: movieSummary)
    }

    return view
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return UITableView.automaticDimension
  }

}

