//
//  MovieEnvoyViewController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import UIKit

class MovieEnvoyViewController: UIViewController {

  // MARK: propeties
  fileprivate let datasource = MovieDBDatasource.sharedInstance
  internal let tableview = UITableView()
  internal var endpoint: APIEndpoint!

  // MARK: outlets

  // MARK: setup
  fileprivate func setupTableview() {
    self.tableview.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(self.tableview)
    self.tableview.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    self.tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    self.tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    self.tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    self.tableview.rowHeight = UITableView.automaticDimension
    self.tableview.estimatedRowHeight = 140.0
    self.tableview.delegate = self

    self.tableview.register(UINib(nibName: "MovieInfoTableViewCell", bundle: nil), forCellReuseIdentifier: MovieInfoTableViewCell.cellIdentifier())
    self.tableview.dataSource = self.datasource
  }

  // MARK: overrides
  override func viewDidLoad() {
    super.viewDidLoad()
    datasource.refreshMovieList(with: endpoint) {
      DispatchQueue.main.async {
        self.tableview.reloadData()
      }
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupTableview()
  }
}

extension MovieEnvoyViewController: UITableViewDelegate {
}
