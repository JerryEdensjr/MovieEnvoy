//
//  MovieDetailViewController.swift
//  MovieEnvoy
//

import UIKit

class MovieDetailViewController: UIViewController, Storyboardable {

  // MARK: - outlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - properties
  var coordinator: MovieDetailCoordinator?
  private var viewModel = MovieDetailViewModel()
  private var movieSummary: MovieSummary?

  // MARK: - overrides
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.setNavigationBarHidden(false, animated: true)
    hideBackButtonText()
  }

  // MARK: - configuration
  func configure(with movieSummary: MovieSummary) {
    self.movieSummary = movieSummary
    viewModel.configure(with: movieSummary)
    
    title = movieSummary.title
    setUpTableView()
  }

}

private extension MovieDetailViewController {
  func setUpTableView() {
    tableView.separatorStyle = .none
    tableView.dataSource = viewModel
    tableView.delegate = viewModel
    registerNibs()
  }

  func registerNibs() {
    tableView.register(MovieDetailHeaderView.nib,
                       forCellReuseIdentifier: MovieDetailHeaderView.identifier)
  }

}
