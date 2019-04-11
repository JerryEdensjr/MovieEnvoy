//
//  APIServiceContext.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

private let baseURL = "https://api.themoviedb.org"
private let imageBaseUrl = "https://image.tmdb.org/t/p/w154"
private let tmbAPIKey = "?api_key=68b13770194a73ff218ee6fae1f2c488"

public enum APIServiceContext {
  case production, staging

  private static var defaultEnvironment: APIServiceContext { return .staging }

  public var baseURLString: String {
    switch self {
    case .production:
      return baseURL
    case .staging:
      return baseURL
    }
  }

  public var imageBaseURLString: String {
    switch self {
    case .production:
      return imageBaseUrl
    case .staging:
      return imageBaseUrl
    }
  }

  public var theMovieDBAPIKey: String {
    switch self {
    case .production:
      return tmbAPIKey
    case .staging:
      return tmbAPIKey
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

