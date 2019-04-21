//
//  MainTabBarCoordinator.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/20/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {

  var children = [Coordinator]()
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
  }

}

extension MainTabBarCoordinator {

  func buildTabBarControllers() -> [UIViewController] {

    var tabBarControllers = [UIViewController]()

    let nowPlayingCoordinator = NowPlayingCoordinator(navigationController: UINavigationController())
    nowPlayingCoordinator.parentCoordinator = self
    nowPlayingCoordinator.start()
    tabBarControllers.append(nowPlayingCoordinator.navigationController)

    let upcomingCoordinator = UpcomingMoviesCoordinator(navigationController: UINavigationController())
    upcomingCoordinator.parentCoordinator = self
    upcomingCoordinator.start()
    tabBarControllers.append(upcomingCoordinator.navigationController)

    let popularCoordinator = PopularMoviesCoordinator(navigationController: UINavigationController())
    popularCoordinator.parentCoordinator = self
    popularCoordinator.start()
    tabBarControllers.append(popularCoordinator.navigationController)

    let topRatedCoordinator = TopRatedCoordinator(navigationController: UINavigationController())
    topRatedCoordinator.parentCoordinator = self
    topRatedCoordinator.start()
    tabBarControllers.append(topRatedCoordinator.navigationController)

    return tabBarControllers
  }

}
