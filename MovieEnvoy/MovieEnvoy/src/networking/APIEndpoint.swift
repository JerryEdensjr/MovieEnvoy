//
//  APIEndpoint.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

enum APIEndpoint: String {
  case nowPlaying = "/3/movie/now_playing"
  case popular = "/3/movie/popular"
  case topRated = "/3/movie/top_rated"
  case upcoming = "/3/movie/upcoming"

  var endpoint: String {
    return rawValue
  }
}
