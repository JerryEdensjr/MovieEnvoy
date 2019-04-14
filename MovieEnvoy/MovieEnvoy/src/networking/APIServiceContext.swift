//
//  APIServiceContext.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

public enum APIServiceContext {
  case production, staging

  private static var defaultEnvironment: APIServiceContext { return .staging }

  public var baseURLString: String {
    switch self {
    case .production:
      return TMDB_BASE_URL
    case .staging:
      return TMDB_BASE_URL
    }
  }

  public var imageBaseURLString: String {
    switch self {
    case .production:
      return TMDB_IMAGE_URL
    case .staging:
      return TMDB_IMAGE_URL
    }
  }

  public var theMovieDBAPIKey: String {
    switch self {
    case .production:
      return TMDB_API_KEY
    case .staging:
      return TMDB_API_KEY
    }
  }

  public init(with environmentIdentifier: String?) {
    guard let environmentIdentifier = environmentIdentifier else {
      self = APIServiceContext.defaultEnvironment
      return
    }

    switch environmentIdentifier {
    case "production":
      self = .production
    case "staging":
      self = .staging
    default:
      self = APIServiceContext.defaultEnvironment
    }
  }

}
