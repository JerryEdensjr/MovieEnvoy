//
//  PopularViewController.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import UIKit

class PopularViewController: MovieEnvoyViewController {

  // MARK: propeties

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
    tableview.contentInset = UIEdgeInsets(top: self.titlebar.frame.maxY, left: 0.0, bottom: 0.0, right: 0.0)
    tableview.setNeedsLayout()
    tableview.layoutIfNeeded()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    tableview.delegate = nil
  }

}

extension PopularViewController {
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row - 10 <= viewModel.movies.count {
      print(items: "Fetch New Data")
    }
  }

}
