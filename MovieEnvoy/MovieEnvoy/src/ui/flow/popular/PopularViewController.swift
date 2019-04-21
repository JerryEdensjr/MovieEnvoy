//
//  PopularViewController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import UIKit

class PopularViewController: MovieEnvoyViewController, Storyboardable {

  private struct Constants {
    static let getNextPageTriggerValue = 10
  }

  // MARK: propeties
  var coordinator: PopularMoviesCoordinator?

  // MARK: outlets
  @IBOutlet weak var titlebar: UIView!

  // MARK: overrides
  override func awakeFromNib() {
    super.awakeFromNib()
    self.endpoint = APIEndpoint.popular
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    view.bringSubviewToFront(self.titlebar)
    tableView.setNeedsLayout()
    tableView.layoutIfNeeded()

    getMovies()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    tableView.delegate = nil
  }

}

extension PopularViewController {
  private func getMovies() {
    viewModel.getPopularMovies {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

}

extension PopularViewController {
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row >= viewModel.movies.count - Constants.getNextPageTriggerValue {
      viewModel.getNextPageOfPopularMovies {
        tableView.reloadData()
      }
    }
  }

}
