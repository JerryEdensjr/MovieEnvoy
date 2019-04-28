//
//  Nibable.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/28/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Foundation
import UIKit

protocol Nibable where Self: UIView {
  static var identifier: String { get }
  static var nib: UINib { get }

}

extension Nibable {
  static var identifier: String {
    return String(describing: self)
  }

}

extension Nibable {
  static var nib: UINib {
    return UINib(nibName: identifier, bundle: Bundle.main)
  }

}

extension Nibable where Self: UIView {
  func loadNibContent() {
    for view in Self.nib.instantiate(withOwner: self, options: nil) {
      if let view = view as? UIView {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
      }
    }
  }

}
