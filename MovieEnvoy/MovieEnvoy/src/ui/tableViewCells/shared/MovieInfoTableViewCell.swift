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
  @IBOutlet private var posterImageView: UIImageView!
  @IBOutlet private var imageShadowView: UIView!
  @IBOutlet private var movieTitle: UILabel!
  @IBOutlet private var overview: UILabel!
  @IBOutlet private var releaseDate: UILabel!

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
    releaseDate.text = movie.releaseDate

    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 4
    paragraphStyle.alignment = .left
    paragraphStyle.lineBreakMode = .byTruncatingTail
    overview.attributedText = NSAttributedString(string: movie.overview, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

    posterImageView.af_setImage(withURL: URL(string: APIService.context.imageBaseURLString + movie.posterPath)!)
  }

  // MARK: tableviewcell support
  static func cellIdentifier() -> String {
    return String(describing: MovieInfoTableViewCell.self)
  }

}
