//
//  TopRatedViewController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import UIKit

class TopRatedViewController: MovieEnvoyViewController, Storyboardable {

  private struct Constants {
    static let getNextPageTriggerValue = 10
  }

  // MARK: propeties
  var coordinator: TopRatedCoordinator?
  
  // MARK: outlets
  @IBOutlet weak var titlebar: UIView!

  // MARK: overrides
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    endpoint = APIEndpoint.topRated
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
    
    view.bringSubviewToFront(self.titlebar)
    tableView.setNeedsLayout()
    tableView.layoutIfNeeded()

    getMovies()
  }

}

extension TopRatedViewController {
  private func getMovies() {
    viewModel.getTopRatedMovies {
      DispatchQueue.main.async { [unowned self] in
        self.tableView.reloadData()
      }
    }
  }

}

extension TopRatedViewController {
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row >= viewModel.movies.count - Constants.getNextPageTriggerValue {
      viewModel.getNextPageOfTopRatedMovies {
        tableView.reloadData()
      }
    }
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let movie = viewModel.movies[safe: indexPath.row],
      let navController = navigationController else {
        fatalError("No movie data available for \(indexPath.row)")
    }

    let movieDetailCoordinator = MovieDetailCoordinator(navigationController: navController)
    movieDetailCoordinator.parentCoordinator = coordinator
    movieDetailCoordinator.movie = movie
    movieDetailCoordinator.start()

  }

}
