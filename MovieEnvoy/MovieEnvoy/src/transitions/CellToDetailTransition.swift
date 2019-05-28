//
//  CellToDetailTransition.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 5/25/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  func snapshot() -> UIImageView? {
    return UIImageView(image: mdbSnapshot())
  }

  public enum MDBSnapshotLayer: Int {
    case `default`, presentation, model
  }

  public func mdbSnapshot(scale: CGFloat = 0, isOpaque: Bool = false,
                         layer layerToUse: MDBSnapshotLayer = .default) -> UIImage? {
    var isSuccess = false
    UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, scale)
    if let context = UIGraphicsGetCurrentContext() {
      isSuccess = true
      switch layerToUse {
      case .default:
        layer.render(in: context)
      case .model:
        layer.model().render(in: context)
      case .presentation:
        layer.presentation()?.render(in: context)
      }
    }

    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return isSuccess ? image : nil
  }

}

/// This class provides a custom animation for pushing and poping between a cell and its detial view counterpart.
///
final class CellToDetailTransition: NSObject, UIViewControllerAnimatedTransitioning {
  private struct Constants {
    static let animationDuration: TimeInterval = 0.35
  }

  var transitionOperation: UINavigationController.Operation = .none

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return Constants.animationDuration
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard transitionOperation != .none else {
      transitionContext.completeTransition(true)
      return
    }
    switch transitionOperation {
    case .push:
      present(using: transitionContext)
    default:
      dismiss(using: transitionContext)
    }
  }

}

private extension CellToDetailTransition {
  func present(using transitionContext: UIViewControllerContextTransitioning) {
    guard let fromVC = transitionContext.viewController(forKey: .from) as? MovieEnvoyViewController,
      let fromView = transitionContext.view(forKey: .from),
      let toVC = transitionContext.viewController(forKey: .to) as? MovieDetailViewController,
      let toView = transitionContext.view(forKey: .to) else {
        transitionContext.completeTransition(true)
        return
    }

    let animationView = transitionContext.containerView
    animationView.frame.origin = CGPoint(x: 0.0, y: 20.0)

    animationView.add(toView)
    toView.alpha = 0.0

    animationView.sendSubviewToBack(toView)

    let tableViewCellProvider = fromVC as TableViewCellProvider
    guard let fromTableViewCell = tableViewCellProvider.selectedTableViewCell() as? MovieInfoTableViewCell,
      let cellSnaphot = fromTableViewCell.snapshot(),
      let posterSnapshot = fromTableViewCell.posterImageView?.snapshot(),
      let movieTitleLabelSnapshot = fromTableViewCell.movieTitle.snapshot(),
      let overviewSnapshot = fromTableViewCell.overview.snapshot(),
      let releaseDateSnapshot = fromTableViewCell.releaseDate.snapshot(),
      let toTableView = toVC.tableView.snapshot(),
      let toContainerView = toVC.view.snapshot()  else {
        transitionContext.completeTransition(true)
        return
    }

    let relativeCellFrame = frameOfViewInWindowsCoordinateSystem(fromTableViewCell)
    fromTableViewCell.alpha = 0.0

    let toFrame = toTableView.frame
    toView.frame = relativeCellFrame

    cellSnaphot.frame = relativeCellFrame
    posterSnapshot.frame = frameOfViewInWindowsCoordinateSystem(fromTableViewCell.posterImageView)
    movieTitleLabelSnapshot.frame = frameOfViewInWindowsCoordinateSystem(fromTableViewCell.movieTitle)
    overviewSnapshot.frame = frameOfViewInWindowsCoordinateSystem(fromTableViewCell.overview)
    releaseDateSnapshot.frame = frameOfViewInWindowsCoordinateSystem(fromTableViewCell.releaseDate)
    toContainerView.alpha = 0.0

    animationView.add(toContainerView,
                      posterSnapshot,
                      releaseDateSnapshot,
                      movieTitleLabelSnapshot,
                      overviewSnapshot)

    let containerMask = CAShapeLayer()
    var frame = toContainerView.frame
    frame.origin.y = 0
    containerMask.path = UIBezierPath(rect: toContainerView.frame).cgPath
    toContainerView.layer.mask = containerMask

    let cellMask = CAShapeLayer()
    cellMask.path = UIBezierPath(rect: cellSnaphot.frame).cgPath
    cellSnaphot.layer.mask = cellMask

    let duration = transitionDuration(using: transitionContext)

    animatePath(for: containerMask, toPath: UIBezierPath(rect: toFrame).cgPath, duration: duration)
    animatePath(for: cellMask, toPath: UIBezierPath(rect: cellSnaphot.frame).cgPath, duration: duration)

    UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: .calculationModePaced, animations: { [unowned self] in
      UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
        fromView.alpha = 0.0
        toView.frame.origin = CGPoint(x: 0.0, y: 44.0)
        toView.frame.size = toFrame.size
        toView.alpha = 0.5
        toTableView.frame = toView.bounds

        guard let headerView = toVC.tableView.headerView(forSection: 0) else { return }
        var frame = self.frameOfViewInWindowsCoordinateSystem(headerView)
        frame.origin.y += 44.0
        posterSnapshot.frame.origin = frame.origin
        posterSnapshot.alpha = 0.0
        releaseDateSnapshot.frame.origin = frame.origin
        releaseDateSnapshot.alpha = 0.0
        movieTitleLabelSnapshot.frame.origin = frame.origin
        movieTitleLabelSnapshot.alpha = 0.0
        overviewSnapshot.frame.origin = frame.origin
        overviewSnapshot.alpha = 0.0
      })

      UIView.addKeyframe(withRelativeStartTime: 0.35, relativeDuration: 0.65, animations: {
        toTableView.alpha = 1.0
        toView.alpha = 1.0
      })

    }, completion: { (finished) in
      if finished {
        fromTableViewCell.alpha = 1.0
        posterSnapshot.removeFromSuperview()
        releaseDateSnapshot.removeFromSuperview()
        movieTitleLabelSnapshot.removeFromSuperview()
        overviewSnapshot.removeFromSuperview()
        toTableView.removeFromSuperview()
        toContainerView.removeFromSuperview()
        transitionContext.completeTransition(true)
      }
    })

  }

  func dismiss(using transitionContext: UIViewControllerContextTransitioning) {
    guard let fromVC = transitionContext.viewController(forKey: .from) as? MovieDetailViewController,
      let toVC = transitionContext.viewController(forKey: .to),
      let toView = toVC.view else {
        transitionContext.completeTransition(true)
        return
    }

    let animationView = transitionContext.containerView

    animationView.add(toView)
    animationView.sendSubviewToBack(toView)

    let duration = transitionDuration(using: transitionContext)

    UIView.animate(withDuration: duration, animations: {
      toView.alpha = 1.0
      fromVC.view.alpha = 0.0
    }, completion: { finished in
      if finished {
        fromVC.view.alpha = 1.0
      }
    })

    transitionContext.completeTransition(true)
  }

  func frameOfViewInWindowsCoordinateSystem(_ view: UIView) -> CGRect {
    if let superview = view.superview {
      return superview.convert(view.frame, to: nil)
    }

    print(items: "[ANIMATION WARNING] Seems like this view is not in views hierarchy\n\(view)\nOriginal frame returned")
    return view.frame
  }

  func animatePath(for layer: CAShapeLayer, toPath: CGPath, duration: TimeInterval) {
    let pathAnimation = CABasicAnimation(keyPath: "path")
    pathAnimation.timingFunction = .init(name: .easeInEaseOut)
    pathAnimation.duration = duration
    pathAnimation.fromValue = layer.path
    pathAnimation.toValue = toPath
    layer.path = toPath
    pathAnimation.isRemovedOnCompletion = false
    layer.add(pathAnimation, forKey: "path")
  }

}
