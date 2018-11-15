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

  // TODO: move the key value to an xcconfig
  var apiKey: String {
    return "?api_key=68b13770194a73ff218ee6fae1f2c488"
  }

  var imageBaseUrl: String {
    return "https://image.tmdb.org/t/p/w154"
  }

  var baseURL: String {
    return "https://api.themoviedb.org"
  }

  /// The endpoint path for the type of endpoint
  var path: String {
    var url: String = self.baseURL

    switch self {
    case .nowPlaying:
      url = url + "/3/movie/now_playing"
    case .popular:
      url = url + "/3/movie/popular"
    case .topRated:
      url = url + "/3/movie/top_rated"
    case .upcoming:
      url = url + "/3/movie/upcoming"
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
