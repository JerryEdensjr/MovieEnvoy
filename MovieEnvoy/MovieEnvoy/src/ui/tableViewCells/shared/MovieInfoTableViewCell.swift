//
//  MovieInfoTableViewCell.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class MovieInfoTableViewCell: UITableViewCell {

  fileprivate static var baseHeight: CGFloat = 80.5

  // MARK: outlets
  @IBOutlet internal var posterImageView: UIImageView!
  @IBOutlet internal var imageShadowView: UIView!
  @IBOutlet internal var movieTitle: UILabel!
  @IBOutlet internal var overview: UILabel!
  @IBOutlet internal var releaseDate: UILabel!

  // MARK: overrides
  override func awakeFromNib() {
    super.awakeFromNib()
    imageShadowView.addShadow(opacity: 0.25)
    posterImageView.roundCorners()
  }

  override func draw(_ rect: CGRect) {
    let size = movieTitle.bounds.size
    movieTitle.sizeToFit()
    if !__CGSizeEqualToSize(size, movieTitle.bounds.size) {
      setNeedsUpdateConstraints()
      updateConstraintsIfNeeded()
    }

    super.draw(rect)
  }

  // MARK: - configureation
  func configure(with movie: MovieSummary) {
    movieTitle.text = movie.title
    releaseDate.text = "Release Date:\n\(movie.releaseDate  ?? "Unknown")"

    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 4
    paragraphStyle.alignment = .left
    paragraphStyle.lineBreakMode = .byTruncatingTail
    overview.attributedText = NSAttributedString(string: movie.overview ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

    guard let posterPath = movie.posterPath,
        let path = MovieDBContext.shared.getPosterURL(for: .PosterMedium, for: posterPath),

      let url = URL(string: path) else {
        return
    }

    posterImageView.af_setImage(withURL: url)
  }

  // MARK: tableviewcell support
  static func cellIdentifier() -> String {
    return String(describing: MovieInfoTableViewCell.self)
  }

}
