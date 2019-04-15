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
  internal let tableview = UITableView()
  internal var endpoint: APIEndpoint = .nowPlaying

  // MARK: outlets

  // MARK: setup
  private func setupTableview() {
    view.addSubview(self.tableview)

    tableview.translatesAutoresizingMaskIntoConstraints = false
    tableview.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    tableview.rowHeight = UITableView.automaticDimension
    tableview.estimatedRowHeight = Constants.estimatedRowHeight
    tableview.showsVerticalScrollIndicator = false

    tableview.register(UINib(nibName: "MovieInfoTableViewCell", bundle: nil), forCellReuseIdentifier: MovieInfoTableViewCell.cellIdentifier())
    tableview.dataSource = viewModel
    tableview.delegate = self
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
