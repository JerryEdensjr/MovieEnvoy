//
//  Movie.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import Foundation

class Movie: Codable {

  let title: String!
  let overview: String!
  let posterPath: String!

  enum CodingKeys: String, CodingKey {
    case title
    case overview
    case posterPath = "poster_path"
  }
}
