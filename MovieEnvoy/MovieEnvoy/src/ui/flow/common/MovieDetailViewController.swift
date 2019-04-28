//
//  MovieDetailViewController.swift
//  MovieEnvoy
//

import UIKit

class MovieDetailViewController: UIViewController, Storyboardable {

  // MARK: - properties
  var coordinator: MovieDetailCoordinator?
  private var movie: MovieSummary?

  // MARK: - overrides
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.setNavigationBarHidden(false, animated: true)
    hideBackButtonText()
  }

  // MARK: - configuration
  func configure(with movie: MovieSummary) {
    self.movie = movie
      
    title = movie.title
  }

}
