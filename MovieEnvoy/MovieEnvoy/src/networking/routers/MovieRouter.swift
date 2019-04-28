//
//  MovieRouter.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

enum MovieRouter: EndpointRouter {
  case GetMoviesNowPlaying
  case GetPopularMovies(page: Int)
  case GetTopRatedMovies(page: Int)
  case GetUpcomingMovies
  case GetMovieDetails(movieID: Int)

  var components: RequestComponents {
    switch self {
    case .GetMoviesNowPlaying:
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY
      ]

      return (.get, APIEndpoint.nowPlaying.endpoint, params, apiVersion: .v1)

    case let .GetPopularMovies(page):
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY,
        "page": page
      ]

      return (.get, APIEndpoint.popular.endpoint, params, apiVersion: .v1)

    case let .GetTopRatedMovies(page):
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY,
        "page": page
      ]

      return (.get, APIEndpoint.topRated.endpoint, params, apiVersion: .v1)

    case .GetUpcomingMovies:
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY
      ]

      return (.get, APIEndpoint.upcoming.endpoint, params, apiVersion: .v1)

    case let .GetMovieDetails(movieID):
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY
      ]

      let endpoint = APIEndpoint.movieDetails.endpoint.replacingOccurrences(of: "{0}", with: "\(movieID)")

      return (.get, endpoint, params, apiVersion: .v1)
    }
  }

}
