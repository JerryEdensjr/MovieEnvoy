//
//  NowPlayingCoordinator.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/20/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

final class NowPlayingCoordinator: Coordinator {

  weak var parentCoordinator: MainTabBarCoordinator?
  var children = [Coordinator]()
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let nowPlayingVC = NowPlayingViewController.instantiate()

    nowPlayingVC.coordinator = self
    nowPlayingVC.tabBarItem = UITabBarItem(title: "Now Playing", image: UIImage(named: "nowPlaying"), selectedImage: nil)
    
    navigationController.pushViewController(nowPlayingVC, animated: false)
  }

}
