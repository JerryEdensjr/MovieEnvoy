//
//  GetMoviesResponseModel.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

struct GetMovieResponseModel: Decodable {
  let results: [MovieSummary]

  // error support
  let statusCode: Int?
  let statusMessage: String?

}
