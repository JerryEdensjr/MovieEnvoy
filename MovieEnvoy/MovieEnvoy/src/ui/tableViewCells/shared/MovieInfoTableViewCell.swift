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
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var movieTitle: UILabel!
  @IBOutlet weak var overview: UILabel!

  // MARK: overrides
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  // MARK: tableviewcell support
  static func cellIdentifier() -> String {
    return String(describing: MovieInfoTableViewCell.self)
  }
}
