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
    self.view.bringSubviewToFront(self.titlebar)

    getMovies()
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
