//
//  MovieDetailHeaderView.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/28/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

class MovieDetailHeaderView: UITableViewHeaderFooterView, Nibable {

  @IBOutlet weak var movieTitleLabel: UILabel!
  @IBOutlet weak var posterImageView: UIImageView!

  func configure(with moviewSummary: MovieSummary) {
    movieTitleLabel.text = moviewSummary.title
    posterImageView.download(url: APIService.context.imageBaseURLString + moviewSummary.posterPath)
  }

  func update(with movieDetail: MovieDetail) {

    let attributedString = NSAttributedString(string: "\(movieDetail.title) (\(movieDetail.releaseYear))")

    movieTitleLabel.attributedText = attributedString
    posterImageView.download(url: APIService.context.imageBaseURLString + movieDetail.posterPath)
  }

}
