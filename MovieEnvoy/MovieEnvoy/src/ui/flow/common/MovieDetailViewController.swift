//
//  MovieDetailViewController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/28/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

  // MARK: - outlets
  @IBOutlet private var tableView: UITableView!

  // MARK: - properties
  var coordinator: MovieDetailCoordinator?

  private var movieSummary: MovieSummary?
  private var viewModel = MovieDetailViewModel()

  // MARK: - overrides
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setUpNavigationBar()
    setUpTableView()
    setUpViewModel()
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }

  // MARK: - configuration
  func configure(with movieSummary: MovieSummary) {
    self.movieSummary = movieSummary
    
    if let movieSummary = self.movieSummary {
      viewModel.configure(with: movieSummary)
    }
  }

}

private extension MovieDetailViewController {
  func setUpTableView() {
    tableView.separatorStyle = .none
    tableView.delegate = viewModel
    tableView.dataSource = viewModel
    tableView.estimatedSectionHeaderHeight = 714.0
    tableView.rowHeight = UITableView.automaticDimension
    tableView.sectionHeaderHeight = UITableView.automaticDimension
    registerNibs()
  }

  func registerNibs() {
    tableView.register(MovieDetailHeaderView.nib,
                       forHeaderFooterViewReuseIdentifier: MovieDetailHeaderView.identifier)
  }

  func setUpViewModel() {
    viewModel.delegate = self
  }

  func setUpNavigationBar() {
    navigationController?.setNavigationBarHidden(false, animated: true)
    navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
  }
}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
  func didUpdateMovieDetail() {
    tableView.reloadData()
  }

}

extension MovieDetailViewController: Storyboardable {}
