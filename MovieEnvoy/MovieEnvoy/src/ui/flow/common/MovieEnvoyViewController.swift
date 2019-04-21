//
//  MovieEnvoyViewController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import UIKit

class MovieEnvoyViewController: UIViewController {

  private struct Constants {
    static let estimatedRowHeight: CGFloat = 151.0
  }

  // MARK: propeties
  internal let viewModel = MovieViewModel()
  internal let tableView = UITableView()
  internal var endpoint: APIEndpoint = .nowPlaying

  // MARK: outlets

  // MARK: setup
  private func setupTableview() {
    view.addSubview(self.tableView)

    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = Constants.estimatedRowHeight
    tableView.showsVerticalScrollIndicator = false
    tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)

    tableView.register(UINib(nibName: "MovieInfoTableViewCell", bundle: nil), forCellReuseIdentifier: MovieInfoTableViewCell.cellIdentifier())
    tableView.dataSource = viewModel
    tableView.delegate = self
  }

  // MARK: overrides
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupTableview()
  }

}

extension MovieEnvoyViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
  }

}
