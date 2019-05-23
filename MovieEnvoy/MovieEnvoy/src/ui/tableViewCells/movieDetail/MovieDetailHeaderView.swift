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

  override func prepareForReuse() {
    super.prepareForReuse()
    movieTitleLabel.attributedText = nil
    backdropImageView.image = nil
  }

  func configure(with moviewSummary: MovieSummary) {
    backdropImageView.download(url: MovieDBContext.shared.getBackdropURL(for: .BackdropLarge, for: moviewSummary.backdropPath))
  }

  func update(with movieDetail: MovieDetail) {

    let titleText = "\(movieDetail.title)\n(\(movieDetail.releaseYear))"

    if let mediumFont = UIFont(name: "HelveticaNeue-Medium", size: 20.0),
      let lightFont = UIFont(name: "HelveticaNeue-Light", size: 20.0) {

      let attributedString = NSMutableAttributedString(string: titleText)

      attributedString.addAttribute(.font, value: mediumFont, range: NSRange(location: 0, length: movieDetail.title.count))
      attributedString.addAttribute(.font, value: lightFont, range: NSRange(location: movieDetail.title.count + 1, length: movieDetail.releaseYear.count + 2))
      attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: attributedString.length))
      movieTitleLabel.attributedText = attributedString

    } else {
      movieTitleLabel.text = titleText
    }

    backdropImageView.download(url: MovieDBContext.shared.getBackdropURL(for: .BackdropLarge, for: movieDetail.backdropPath))
  }

}
