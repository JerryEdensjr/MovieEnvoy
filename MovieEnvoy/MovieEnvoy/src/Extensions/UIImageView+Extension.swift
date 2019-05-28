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
    static let ShadowViewTag = 0xDEADBEEF
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

@IBDesignable class Placeholder: UIImageView {
  /// Title text to render inside the image
  @IBInspectable var title: String = ""

  /// The color of the title text
  @IBInspectable var textColor: UIColor = .white

  /// The font size of the title text
  @IBInspectable var textFontSize: CGFloat = 20

  /// Whether to round the edges of the placeholder graphic.
  /// This automatically rounds to the smallest of the width
  /// or height of the view.
  @IBInspectable var rounded: Bool = false

  /// The label used to render title and size text
  private var label: UILabel!

  /// Adjustment in font size to make the title font slightly bigger
  private let titleFontSizeAdjustment: CGFloat = 4

  override required init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    configure()
  }

  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    configure()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    configure()
  }

  func configure() {
    if label == nil {
      // make sure we don't render the label outside of ourselves
      clipsToBounds = true

      label = UILabel()
      label.numberOfLines = 0
      label.textAlignment = .center
      addSubview(label)

      // center the label inside the placeholder space
      label.translatesAutoresizingMaskIntoConstraints = false
      label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
      label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    // apply rounding as needed
    if rounded == true {
      layer.cornerRadius = min(bounds.midX, bounds.midY)
    }

    // put the width and height for this view into a string
    let width = Int(bounds.width)
    let height = Int(bounds.height)
    let size = "\(width)x\(height)"

    // configure attributes of the size text
    let sizeAttrs =  [NSAttributedString.Key.font: UIFont.systemFont(ofSize: textFontSize)]
    let sizeString = NSAttributedString(string: size, attributes: sizeAttrs)

    if title.isEmpty {
      // if we don't have a size render the text immediately
      label.attributedText = sizeString
    } else {
      // if we do have a title, prepare that with some attributes that are slightly
      // bigger than the size
      let titleAttrs = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: textFontSize + titleFontSizeAdjustment)]
      let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttrs)

      // append the size string and put it inside the label
      titleString.append(sizeString)
      label.attributedText = titleString
    }

    // make sure the label color reflects the latest setting
    label.textColor = textColor
  }
}
