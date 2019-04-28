//
//  MovieDetailHeaderView.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/28/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

class MovieDetailHeaderView: UIView, Nibable {

  @IBOutlet weak var movieTitleLabel: UILabel!
  @IBOutlet weak var posterImageView: UIImageView!

  func configure(with movieDetail: MovieDetail) {
    movieTitleLabel.text = movieDetail.title
//    posterImageView
  }

}
