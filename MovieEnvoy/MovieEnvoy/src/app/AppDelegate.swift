//
//  AppDelegate.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    loadMovieDBConfig()
    setupAppearances()

    return true
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = MainTabbarController()
    window?.makeKeyAndVisible()

    return true
  }

  private func setupAppearances() {
    let appearance = UINavigationBar.appearance()
    appearance.tintColor = .black
  }

  private func loadMovieDBConfig() {
    MovieDBContext.shared.getMovieDBCofig()
  }

}
