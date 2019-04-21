//
//  Collection+Extension.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/21/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Foundation

extension Collection {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
