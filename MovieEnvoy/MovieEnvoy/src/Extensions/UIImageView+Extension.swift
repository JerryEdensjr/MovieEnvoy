//
//  UIImageView+Extension.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/29/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

  struct Constants {
    static let ShadowViewTag = 554433
  }

  func download(url: String?, showIndicator: Bool = true, placeholder: UIImage? = nil, downsample: Bool = true) {
    guard
      let urlString = url,
      let url = URL(string: urlString) else {
        image = placeholder
        return
    }

    let imageOptions: KingfisherOptionsInfo = [
      .scaleFactor(UIScreen.main.scale),
      .transition(.fade(0.2)),
      .cacheOriginalImage
    ]

    var kf = self.kf

    kf.indicatorType = showIndicator ? .activity : .none
    kf.setImage(with: url, placeholder: placeholder, options: imageOptions)
  }

  func cancelDownload() {
    self.kf.cancelDownloadTask()
  }

  func addBlurTransition() {
    // Add blur effect
    let blurEffect = UIBlurEffect(style: .regular)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)

    blurEffectView.frame = self.bounds
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    self.addSubview(blurEffectView)

    // Remove blur effect
    UIView.animate(withDuration: 0.25, animations: {
      blurEffectView.alpha = 0
    }, completion: { _ in
      blurEffectView.removeFromSuperview()
    })
  }

  func addOverlay() {
    let overlay = UIView()
    overlay.backgroundColor = .black
    overlay.alpha = 0.3
    self.addSubview(overlay)
    overlay.translatesAutoresizingMaskIntoConstraints = false
    overlay.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    overlay.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    overlay.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    overlay.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
  }

  func addShadowToImageView(with radius: CGFloat = 5.0, for offsetSize: CGSize = CGSize(width: 0.0, height: 2.0), shadowOpacity: CGFloat = 0.1) {
    guard let superview = self.superview,
      superview.viewWithTag(Constants.ShadowViewTag) == nil else {
        return
    }

    let outerView = UIView(frame: self.bounds)
    outerView.tag = Constants.ShadowViewTag
    superview.insertSubview(outerView, belowSubview: self)

    outerView.translatesAutoresizingMaskIntoConstraints = false
    outerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    outerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    outerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    outerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

    outerView.backgroundColor = .clear
    outerView.clipsToBounds = false
    outerView.layer.allowsGroupOpacity = false
    outerView.layer.cornerRadius = self.layer.cornerRadius
    outerView.layer.shadowColor = UIColor.black.cgColor
    outerView.layer.shadowOpacity = Float(shadowOpacity)
    outerView.layer.shadowRadius = radius
    outerView.layer.shadowOffset = offsetSize
    outerView.layer.shadowPath = UIBezierPath(roundedRect: outerView.bounds,
                                              cornerRadius: self.layer.cornerRadius).cgPath
  }

  func circularize() {
    layer.cornerRadius = frame.width / 2
    layer.masksToBounds = true
  }

  func curveBottom(curvedPercent: CGFloat) {
    guard curvedPercent <= 1 && curvedPercent > 0 else { return }

    let width = self.bounds.size.width
    let height = self.bounds.size.height
    let arrowPath = UIBezierPath()

    arrowPath.move(to: CGPoint(x: 0, y: 0))
    arrowPath.addLine(to: CGPoint(x: width, y: 0))
    arrowPath.addLine(to: CGPoint(x: width, y: height - (height * curvedPercent)))

    arrowPath.addQuadCurve(to: CGPoint(x: 0, y: height - (height * curvedPercent)), controlPoint: CGPoint(x: width / 2, y: height))

    arrowPath.addLine(to: CGPoint(x: 0, y: 0))
    arrowPath.close()

    let shapeLayer = CAShapeLayer(layer: layer)

    shapeLayer.path = arrowPath.cgPath
    shapeLayer.frame = bounds
    shapeLayer.masksToBounds = true

    layer.mask = shapeLayer
  }

}
