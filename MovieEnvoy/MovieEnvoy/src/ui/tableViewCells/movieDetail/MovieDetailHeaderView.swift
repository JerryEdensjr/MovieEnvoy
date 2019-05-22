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
  @IBOutlet weak var backdropImageView: UIImageView!

  func configure(with moviewSummary: MovieSummary) {
    movieTitleLabel.text = moviewSummary.title

    backdropImageView.download(url: MovieDBContext.shared.getBackdropURL(for: .BackdropLarge, for: moviewSummary.backdropPath))
  }

  func update(with movieDetail: MovieDetail) {

    let attributedString = NSAttributedString(string: "\(movieDetail.title) (\(movieDetail.releaseYear))")
    movieTitleLabel.attributedText = attributedString

    backdropImageView.download(url: MovieDBContext.shared.getBackdropURL(for: .BackdropLarge, for: movieDetail.backdropPath))
  }

}
