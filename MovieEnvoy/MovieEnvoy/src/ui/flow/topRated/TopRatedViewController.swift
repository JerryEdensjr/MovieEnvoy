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
  override func awakeFromNib() {
    super.awakeFromNib()
    self.endpoint = APIEndpoint.topRated
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.view.bringSubviewToFront(self.titlebar)
    self.tableView.setNeedsLayout()
    self.tableView.layoutIfNeeded()

    getMovies()
  }

}

extension TopRatedViewController {
  private func getMovies() {
    viewModel.getTopRatedMovies {
      DispatchQueue.main.async {
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

}
