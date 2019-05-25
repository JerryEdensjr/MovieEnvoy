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
    appearance.barTintColor = .black
    appearance.tintColor = UIColor(named: "globalTint")
    appearance.isTranslucent = false
    appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    let tabbarAppearance = UITabBar.appearance()
    tabbarAppearance.barTintColor = .black
    tabbarAppearance.tintColor = UIColor(named: "globalTint")
    
  }

  private func loadMovieDBConfig() {
    MovieDBContext.shared.getMovieDBCofig()
  }

}
