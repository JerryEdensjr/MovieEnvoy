//
//  MovieRouter.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

enum MovieRouter: EndpointRouter {
  case getMoviesNowPlaying
  case getPopularMovies(page: Int)
  case getTopRatedMovies(page: Int)
  case getUpcomingMovies

  var components: RequestComponents {
    switch self {
    case .getMoviesNowPlaying:
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY
      ]

      return (.get, APIEndpoint.nowPlaying.endpoint, params, apiVersion: .v1)

    case let .getPopularMovies(page):
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY,
        "page": page
      ]

      return (.get, APIEndpoint.popular.endpoint, params, apiVersion: .v1)

    case let .getTopRatedMovies(page):
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY,
        "page": page
      ]

      return (.get, APIEndpoint.topRated.endpoint, params, apiVersion: .v1)

    case .getUpcomingMovies:
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY
      ]

      return (.get, APIEndpoint.upcoming.endpoint, params, apiVersion: .v1)
    }
  }

}
