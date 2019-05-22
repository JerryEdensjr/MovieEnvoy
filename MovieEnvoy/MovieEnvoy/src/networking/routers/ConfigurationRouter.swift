//
//  ConfigurationRouter.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 5/22/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

enum ConfigurationRouter: EndpointRouter {
  case GetMovieDBConfiguration

  var components: RequestComponents {
    switch self {
    case .GetMovieDBConfiguration:
      let params: [String: Any] = [
        "api_key": TMDB_API_KEY
      ]

      return (.get, APIEndpoint.configuration.endpoint, params, apiVersion: .v1)
    }
  }

}
