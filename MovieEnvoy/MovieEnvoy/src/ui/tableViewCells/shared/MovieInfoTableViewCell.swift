//
//  MovieInfoTableViewCell.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import Foundation
import UIKit

class MovieInfoTableViewCell: UITableViewCell {

  fileprivate static var baseHeight: CGFloat = 80.5

  // MARK: outlets
  @IBOutlet private var posterImageView: UIImageView!
  @IBOutlet private var imageShadowView: UIView!
  @IBOutlet private var movieTitle: UILabel!
  @IBOutlet private var overview: UILabel!

  // MARK: overrides
  override func awakeFromNib() {
    super.awakeFromNib()
    imageShadowView.addShadow(opacity: 0.25)
    posterImageView.roundCorners()
  }

  func configure(with movie: Movie) {
    movieTitle.text = movie.title

    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 4
    paragraphStyle.alignment = .left
    overview.attributedText = NSAttributedString(string: movie.overview, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

    posterImageView.af_setImage(withURL: URL(string: APIService.context.imageBaseURLString + movie.posterPath)!)
  }

  // MARK: tableviewcell support
  static func cellIdentifier() -> String {
    return String(describing: MovieInfoTableViewCell.self)
  }

}
