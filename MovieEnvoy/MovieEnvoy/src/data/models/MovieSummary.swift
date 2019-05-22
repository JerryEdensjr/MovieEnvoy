//
//  Movie.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import Foundation

final class MovieSummary: Decodable {

  let id: Int
  let adult: Bool
  let backdropPath: String
  let title: String
  let overview: String
  let posterPath: String
  let releaseDate: String
  let voteAverage: Double
  let voteCount: Int

}

extension MovieSummary: CustomDebugStringConvertible {
  var debugDescription: String {
    return """
    Movie:
      id: \(id)
      title: \(title)
    """
  }

}
