//
//  MovieRouter.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

enum MovieRouter: EndpointRouter {
  case getMoviesNowPlaying
  case getPopularMovies
  case getTopRatedMovies
  case getUpcomingMovies

  var components: RequestComponents {
    switch self {
    case .getMoviesNowPlaying:
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY
      ]

      return (.get, APIEndpoint.nowPlaying.endpoint, params, apiVersion: .v1)

    case .getPopularMovies:
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY
      ]

      return (.get, APIEndpoint.popular.endpoint, params, apiVersion: .v1)

    case .getTopRatedMovies:
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY
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
