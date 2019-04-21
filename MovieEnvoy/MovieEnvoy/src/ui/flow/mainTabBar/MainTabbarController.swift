//
//  MainTabbarController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/20/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

  var coordinator: MainTabBarCoordinator?

  override func viewDidLoad() {
    super.viewDidLoad()

    coordinator = MainTabBarCoordinator(navigationController: UINavigationController())
    coordinator?.start()

    viewControllers = coordinator?.buildTabBarControllers()
  }

}
