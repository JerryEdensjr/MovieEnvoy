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
  private func getMovies() {
    viewModel.getUpcomingMovies {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

}
