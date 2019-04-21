//
//  PopularMoviesCoordinator.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/20/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

final class PopularMoviesCoordinator: Coordinator {

  weak var parentCoordinator: MainTabBarCoordinator?
  var children = [Coordinator]()
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let popularVC = PopularViewController.instantiate()

    popularVC.coordinator = self
    popularVC.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(named: "popular"), selectedImage: nil)

    navigationController.pushViewController(popularVC, animated: false)
  }

}
