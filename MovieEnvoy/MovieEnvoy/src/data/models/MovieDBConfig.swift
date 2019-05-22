//
//  MovieDBConfig.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 5/22/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

final class MovieDBConfig {

  let backdropSizes: [String]
  let baseUrl: String
  let logoSizes: [String]
  let posterSizes: [String]
  let profileSizes: [String]
  let secureBaseUrl: String
  let stillSizes: [String]

  init(with response: GetMovieDBConfigResponseModel) {
    backdropSizes = response.images.backdropSizes
    baseUrl = response.images.baseUrl
    logoSizes = response.images.logoSizes
    posterSizes = response.images.posterSizes
    profileSizes = response.images.profileSizes
    secureBaseUrl = response.images.secureBaseUrl
    stillSizes = response.images.stillSizes
  }

}
