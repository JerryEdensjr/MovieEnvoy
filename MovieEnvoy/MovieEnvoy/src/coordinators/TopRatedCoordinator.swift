//
//  TopRatedCoordinator.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/20/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

final class TopRatedCoordinator: Coordinator {

  weak var parentCoordinator: MainTabBarCoordinator?
  var children = [Coordinator]()
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let topRated = TopRatedViewController.instantiate()
    
    topRated.coordinator = self
    topRated.tabBarItem = UITabBarItem(title: "Top Rated", image: UIImage(named: "topRated"), selectedImage: nil)

    navigationController.pushViewController(topRated, animated: false)
  }

}
