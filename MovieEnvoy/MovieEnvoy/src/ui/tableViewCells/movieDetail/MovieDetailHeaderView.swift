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

  func configure(with movieSummary: MovieSummary) {
    guard let backdropPath = movieSummary.backdropPath,
      let title = movieSummary.title else { return }

    styleMovieTitle(with: title)
    backdropImageView.download(url: MovieDBContext.shared.getBackdropURL(for: .BackdropLarge, for: backdropPath))
  }

  func update(with movieDetail: MovieDetail) {
    styleMovieTitle(with: movieDetail.title)
    backdropImageView.download(url: MovieDBContext.shared.getBackdropURL(for: .BackdropLarge, for: movieDetail.backdropPath))
  }

}

private extension MovieDetailHeaderView {
  func styleMovieTitle(with movieTitle: String) {
    if let attributedTitle = makeAttributedString(from: movieTitle) {
      movieTitleLabel.attributedText = attributedTitle
    } else {
      movieTitleLabel.text = movieTitle
    }
  }

  func makeAttributedString(from string: String) -> NSAttributedString? {
    guard let mediumFont = UIFont(name: "HelveticaNeue-Medium", size: 20.0) else { return nil }

    let attributedString = NSMutableAttributedString(string: string)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center

    attributedString.addAttribute(.font, value: mediumFont, range: NSRange(location: 0, length: string.count))
    attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: string.count))
    attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: attributedString.length))

    return attributedString
  }

}
