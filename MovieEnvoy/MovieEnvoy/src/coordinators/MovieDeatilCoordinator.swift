//
//  MovieDeatilCoordinator.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/21/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

final class MovieDetailCoordinator: Coordinator {

  var parentCoordinator: Coordinator?
  var children = [Coordinator]()
  var navigationController: UINavigationController

  var movie: Movie?

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    guard let movie = self.movie else {
      fatalError("The movie object was not set")
    }

    let viewController = MovieDetailViewController.instantiate()

    viewController.coordinator = self
    viewController.configure(with: movie)
    
    navigationController.pushViewController(viewController, animated: true)
  }

}
