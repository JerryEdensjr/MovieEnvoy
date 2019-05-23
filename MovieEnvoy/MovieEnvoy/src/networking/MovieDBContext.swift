//
//  MovieDBContext.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 5/22/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Foundation

enum LogoSize: Int {
  case LogoThumbnailSmall = 0
  case LogoThumbnailLarge
  case LogoNormal
  case LogoMedium
  case LogoLarge
  case LogoXtraLarge
  case LogoOriginal
}

enum BackdropSize: Int {
  case BackdropSmall = 0
  case BackdropNormal
  case BackdropLarge
  case BackdropOriginal
}

enum PosterSize: Int {
  case PosterThumbnail = 0
  case PosterNormal
  case PosterMedium
  case PosterTall
  case PosterVeryTall
  case PosterXtraTall
  case PosterOriginal
}

let movieDBConfigUpdateNotification = Notification.Name("MovieDBConfigUpdateNotification")

final class MovieDBContext {
  static let shared = MovieDBContext()
  private init() {}

  private(set) var movieDBConfig: MovieDBConfig?

  func getMovieDBCofig() {
    APIService.shared.getMovieDBConfiguration { [weak self] (result) in
      guard let self = self else { return }

      switch result {
      case .success(let movieDBConfig):
        self.movieDBConfig = movieDBConfig
        NotificationCenter.default.post(name: movieDBConfigUpdateNotification, object: nil)
      case .failure(let error):
        print(items: error.localizedDescription)
      }
    }
  }

  func getBaseURL(for apiVersion: APIVersion) -> String {
    guard let movieDBConfig = self.movieDBConfig else { return "error" }

    switch apiVersion {
    case .v1:
      switch APIService.Defaults.environment {
      case .production:
        return movieDBConfig.secureBaseUrl
      case .staging:
        return movieDBConfig.secureBaseUrl
      }
    }
  }

  func getBackdropURL(for size: BackdropSize, for backdropPath: String) -> String? {
    guard let movieDBConfig = self.movieDBConfig,
      let size = movieDBConfig.backdropSizes[safe: size.rawValue] else { return nil }

    return String("\(getBaseURL(for: .v1))\(size)\(backdropPath)")
  }

  func getLogoURL(for size: LogoSize, for logoPath: String) -> String? {
    guard let movieDBConfig = self.movieDBConfig,
      let size = movieDBConfig.logoSizes[safe: size.rawValue] else { return nil }

    return String("\(getBaseURL(for: .v1))\(size)\(logoPath)")
  }

  func getPosterURL(for size: PosterSize, for posterPath: String) -> String? {
    guard let movieDBConfig = self.movieDBConfig,
      let size = movieDBConfig.posterSizes[safe: size.rawValue] else { return nil }

    return String("\(getBaseURL(for: .v1))\(size)\(posterPath)")
  }

}
