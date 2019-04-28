//
//  UIViewController+Extension.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/27/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

extension UIViewController {

  func hideBackButtonText() {
    navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
  }

}
