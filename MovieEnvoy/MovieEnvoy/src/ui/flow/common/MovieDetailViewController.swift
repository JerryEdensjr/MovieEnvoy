//
//  MovieDetailViewController.swift
//  MovieEnvoy
//

import UIKit

class MovieDetailViewController: UIViewController, Storyboardable {

  // MARK: - properties
  var coordinator: MovieDetailCoordinator?
  private var movie: Movie?

  // MARK: - configuration
  func configure(with movie: Movie) {
    self.movie = movie
  }

}
