//
//  MovieDeatilCoordinator.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/21/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

final class MovieDetailCoordinator: Coordinator {

  var children = [Coordinator]()
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let viewController = MovieDetailViewController.instantiate()

    viewController.coordinator = self
    
    navigationController.pushViewController(viewController, animated: true)
  }

}
