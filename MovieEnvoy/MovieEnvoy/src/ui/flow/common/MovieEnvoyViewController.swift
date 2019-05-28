//
//  MovieEnvoyViewController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018-2019 Edens R&D. All rights reserved.
//

import UIKit

class MovieEnvoyViewController: UIViewController {

  private struct Constants {
    static let estimatedRowHeight: CGFloat = 151.0
    static let topInset: CGFloat = 34.0
    static let titleBarHeight: CGFloat = 44.0
  }

  // MARK: propeties
  private var previousTableViewWidth: CGFloat = 0.0
  private var customTransition = CellToDetailTransition()
  internal let viewModel = MovieViewModel()
  internal let tableView = UITableView()
  internal var endpoint: APIEndpoint = .nowPlaying

  // MARK: outlets

  // MARK: overrides
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setUp()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
  }

  override var prefersStatusBarHidden: Bool {
    return false
  }

  // MARK: setup
  private func setUp() {
    view.backgroundColor = .magenta
    setUupTableview()
  }

  private func setUpNotificationHandlers() {
    NotificationCenter.default.addObserver(forName: movieDBConfigUpdateNotification, object: nil, queue: nil) { (notification) in
      DispatchQueue.main.async { [unowned self] in
        self.tableView.reloadData()
      }
    }
  }

  private func setUupTableview() {
    view.addSubview(self.tableView)

    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = Constants.estimatedRowHeight
    tableView.showsVerticalScrollIndicator = false
    tableView.contentInset = UIEdgeInsets(top: Constants.topInset, left: 0.0, bottom: 0.0, right: 0.0)

    tableView.register(UINib(nibName: "MovieInfoTableViewCell", bundle: nil), forCellReuseIdentifier: MovieInfoTableViewCell.cellIdentifier())
    
    tableView.dataSource = viewModel
    tableView.delegate = self
  }

}

extension MovieEnvoyViewController: UITableViewDelegate {
  // subclasses should override these funcs
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}

}

extension MovieEnvoyViewController: UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {
  func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    switch operation {
    case .push:
      customTransition.transitionOperation = .push
    case .pop:
      customTransition.transitionOperation = .pop
    case .none:
      customTransition.transitionOperation = .none
    @unknown default:
      fatalError()
    }
    
    return customTransition
  }

}

extension MovieEnvoyViewController: TableViewCellProvider {
  func selectedTableViewCell() -> UITableViewCell {
    guard let indexPath = tableView.indexPathForSelectedRow,
      let cell = tableView.cellForRow(at: indexPath) else {
        return UITableViewCell()
    }

    return cell
  }

}
