//
//  GetMovieDetailResponse.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/27/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

struct GetMoviesDetailResponse: Codable {
  let id: Int
  let imdbId: String

  let adult: Bool
  let backdropPath: String
  let belongsToCollection: MovieCollection
  let budget: Int
  let genres: [MovieGenre]
  let homepage: String
  let originalLanguage: String
  let originalTitle: String
  let overview: String
  let popularity: Double
  let posterPath: String
  let productionCompanies: [ProductionCompanies]
  let releaseDate: String  // yyyy-MM-dd
  let revenue: Int
  let runtime: Int
  let spokenLanguages: [SpokenLanguage]
  let status: String
  let tagline: String
  let title: String
  let video: Bool
  let voteAverage: Double
  let voteCount: Int

  // error support
  let statusCode: Int?
  let statusMessage: String?
}
