//
//  Movie.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import Foundation

class Movie: Codable {

  let id: Int
  let title: String
  let overview: String
  let posterPath: String
  let releaseDate: String
  let voteAverage: Double
  let voteCount: Int

}
