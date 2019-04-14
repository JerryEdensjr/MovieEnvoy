//
//  Endpoint.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import Foundation
import Alamofire

/// The endpoints used to fetch movie information
enum Endpoint {
  case nowPlaying
  case popular
  case topRated
  case upcoming
  case image
}

/// This enum returns the full url path
extension Endpoint {

  var apiKey: String {
    return TMDB_API_KEY
  }

  var imageBaseUrl: String {
    return TMDB_IMAGE_URL
  }

  var baseURL: String {
    return TMDB_BASE_URL
  }

  /// The endpoint path for the type of endpoint
  var path: String {
    var url: String = self.baseURL

    switch self {
    case .nowPlaying:
      url += "/3/movie/now_playing"
    case .popular:
      url += "/3/movie/popular"
    case .topRated:
      url += "/3/movie/top_rated"
    case .upcoming:
      url += "/3/movie/upcoming"
    case .image:
      url = self.imageBaseUrl
      return url
    }

    return url + self.apiKey
  }

  var method: HTTPMethod {
    return HTTPMethod.get
  }
}
