//
//  NowPlayingViewController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import UIKit

class NowPlayingViewController: MovieEnvoyViewController, Storyboardable {

  // MARK: propeties
  var coordinator: NowPlayingCoordinator?
  
  // MARK: outlets
  @IBOutlet weak var titlebar: UIView!

  // MARK: overrides
  override func awakeFromNib() {
    super.awakeFromNib()
    self.endpoint = APIEndpoint.nowPlaying
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    view.bringSubviewToFront(titlebar)
    navigationController?.setNavigationBarHidden(true, animated: false)
    
    getMovies()
  }

}

extension NowPlayingViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let movie = viewModel.movies[safe: indexPath.row],
      let navController = navigationController else {
        fatalError("No movie data available for \(indexPath.row)")
    }

    // TODO: move to a coordiator
    let movieDetailCoordinator = MovieDetailCoordinator(navigationController: navController)
    movieDetailCoordinator.parentCoordinator = coordinator
    movieDetailCoordinator.movie = movie
    movieDetailCoordinator.start()

  }

}

extension NowPlayingViewController {
  private func getMovies() {
    viewModel.getMoviesPlayingNow {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

}
