//
//  UpcomingMoviesCoordinator.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/20/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

final class UpcomingMoviesCoordinator: Coordinator {

  weak var parentCoordinator: MainTabBarCoordinator?
  var children = [Coordinator]()
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let upcomingVC = ComingSoonViewController.instantiate()

    upcomingVC.coordinator = self
    upcomingVC.tabBarItem = UITabBarItem(title: "Upcoming", image: UIImage(named: "upcoming"), selectedImage: nil)

    navigationController.pushViewController(upcomingVC, animated: false)
  }

}
