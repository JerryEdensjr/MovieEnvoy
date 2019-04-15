//
//  TopRatedViewController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import UIKit

class TopRatedViewController: MovieEnvoyViewController {

  // MARK: propeties

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
    self.tableview.contentInset = UIEdgeInsets(top: self.titlebar.frame.maxY, left: 0.0, bottom: 0.0, right: 0.0)
    self.tableview.setNeedsLayout()
    self.tableview.layoutIfNeeded()
    
    getMovies()
  }

}

extension TopRatedViewController {
  private func getMovies() {
    viewModel.getTopRatedMovies {
      DispatchQueue.main.async {
        self.tableview.reloadData()
      }
    }
  }

}
