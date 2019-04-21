//
//  Storyboardable.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/20/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

protocol Storyboardable where Self: UIViewController {
  static func instantiate() -> Self

}

extension Storyboardable {
  static func instantiate() -> Self  {
    let storyboard = UIStoryboard(name: String(describing: self), bundle: Bundle.main)
    let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self))
    return viewController as! Self
  }

}
