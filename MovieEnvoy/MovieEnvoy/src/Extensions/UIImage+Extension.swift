//
//  UIImage+Extension.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/28/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImage {

  public static func download(url: URL?,
                              placeholder: UIImage? = nil,
                              completion: @escaping (UIImage?) -> Void) {
    guard let url = url else {
      completion (placeholder)
      return
    }

    KingfisherManager.shared.retrieveImage(with: url) { (result) in
      switch result {
      case .success(let retrieveImageResult):
        DispatchQueue.main.async {
          completion(retrieveImageResult.image)
        }
      case .failure(let error):
        print(items: error.localizedDescription)
      }
    }
  }

  static var placeholderContact: UIImage? {
    return UIImage(named: "placeholderContact")
  }

  static var coutureLogo: UIImage? {
    return UIImage(named: "CoutureLogo")
  }

  static var userImagePlaceholder: UIImage? {
    return UIImage(named: "placeholderContact")
  }

}
