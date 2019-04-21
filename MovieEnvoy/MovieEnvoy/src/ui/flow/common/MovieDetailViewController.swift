//
//  MovieDetailViewController.swift
//  MovieEnvoy
//

import UIKit

class MovieDetailViewController: UIViewController {

  // MARK: - properties
  private var movie: Movie?

  // MARK: - overrides
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - configuration
  func configure(with movie: Movie) {
    self.movie = movie
  }

}
