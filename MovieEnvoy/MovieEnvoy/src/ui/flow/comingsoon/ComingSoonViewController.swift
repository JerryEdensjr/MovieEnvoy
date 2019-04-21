//
//  ComingSoonViewController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import UIKit

class ComingSoonViewController: MovieEnvoyViewController, Storyboardable {

  // MARK: propeties
  var coordinator: UpcomingMoviesCoordinator?
  
  // MARK: outlets
  @IBOutlet private var titlebar: UIView!

  // MARK: overrides
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.endpoint = APIEndpoint.upcoming
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
    
    self.view.bringSubviewToFront(self.titlebar)
    self.tableView.setNeedsLayout()
    self.tableView.layoutIfNeeded()

    getMovies()
  }

}

extension ComingSoonViewController {

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let movie = viewModel.movies[safe: indexPath.row],
      let navController = navigationController else {
        fatalError("No movie data available for \(indexPath.row)")
    }

    // get rid of the Back text
    title = ""
    let movieDetailCoordinator = MovieDetailCoordinator(navigationController: navController)
    movieDetailCoordinator.parentCoordinator = coordinator
    movieDetailCoordinator.movie = movie
    movieDetailCoordinator.start()

  }

}

extension ComingSoonViewController {
  private func getMovies() {
    viewModel.getUpcomingMovies {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

}
