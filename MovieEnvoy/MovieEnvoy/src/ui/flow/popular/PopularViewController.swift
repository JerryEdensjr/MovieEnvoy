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

  // MARK: overrides
  override func awakeFromNib() {
    super.awakeFromNib()
    self.endpoint = Endpoint.popular
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
