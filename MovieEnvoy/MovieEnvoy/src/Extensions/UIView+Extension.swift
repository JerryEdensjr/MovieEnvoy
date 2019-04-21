//
//  UIView+Extension.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

extension UIView {

  /// Adds a shadow to self.
  ///
  /// - Parameters:
  ///   - shadowColor: The color of the shadow.
  ///   - opacity: The transparency of the shadow, a value between 0.0 => 1.0.
  ///   - radius: The blur radius used to create the shadow.
  ///   - offset: Direction of the shadow.
  func addShadow(shadowColor: UIColor = .black, opacity: Double = 0.16, radius: Double = 3.0, offset: CGSize = CGSize(width: 0, height: 3)) {
    clipsToBounds = false
    backgroundColor = UIColor.clear
    layer.shadowColor = shadowColor.cgColor
    layer.shadowOpacity = Float(opacity)
    layer.shadowRadius = CGFloat(radius)
    layer.shadowOffset = offset
  }

  /// Rounds the corners of self.
  ///
  /// - Parameter radius: The amount of curve to apply.
  func roundCorners(with radius: CGFloat = 3.0) {
    layer.cornerRadius = radius
    layer.masksToBounds = true
  }

}

// MARK: - IBInspectable
extension UIView {

  /// Exposes this property to the Interface Builder.
  @IBInspectable
  var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }

  /// Exposes this property to the Interface Builder.
  @IBInspectable
  var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }

  /// Exposes this property to the Interface Builder.
  @IBInspectable
  var borderColor: UIColor? {
    get {
      return UIColor(cgColor: layer.borderColor!)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }

}
