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
      return (.get, APIEndpoint.nowPlaying.endpoint, nil, apiVersion: .v1)

    case .getPopularMovies:
      return (.get, APIEndpoint.popular.endpoint, nil, apiVersion: .v1)

    case .getTopRatedMovies:
      return (.get, APIEndpoint.topRated.endpoint, nil, apiVersion: .v1)

    case .getUpcomingMovies:
      return (.get, APIEndpoint.upcoming.endpoint, nil, apiVersion: .v1)
    }
  }

}
