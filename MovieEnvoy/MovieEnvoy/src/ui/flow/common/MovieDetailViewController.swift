//
//  MovieDetailViewController.swift
//  MovieEnvoy
//

import UIKit

class MovieDetailViewController: UIViewController, Storyboardable {

  // MARK: - properties
  var coordinator: MovieDetailCoordinator?
  private var movie: Movie?

  // MARK: - overrides
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.setNavigationBarHidden(false, animated: true)
  }

  // MARK: - configuration
  func configure(with movie: Movie) {
    self.movie = movie
      
    title = movie.title
  }

}
