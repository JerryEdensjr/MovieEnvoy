//
//  MovieDetail.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/27/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Foundation

final class MovieDetail {
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
  let productionCompanies: [ProductionCompany]
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

  var releaseYear: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    if let date = formatter.date(from: releaseDate) {
      let year = Calendar.current.component(.year, from: date)
      return "\(year)"
    }

    return ""
  }

  init(with responseModel: GetMoviesDetailResponse) {
    id = responseModel.id
    imdbId = responseModel.imdbId

    adult = responseModel.adult ?? false
    backdropPath = responseModel.backdropPath ?? ""
    belongsToCollection = responseModel.belongsToCollection ?? MovieCollection()
    budget = responseModel.budget ?? 0
    genres = responseModel.genres ?? [MovieGenre]()
    homepage = responseModel.homepage ?? ""
    originalLanguage = responseModel.originalLanguage ?? ""
    originalTitle = responseModel.originalTitle ?? ""
    overview = responseModel.overview ?? ""
    popularity = responseModel.popularity ?? 0
    posterPath = responseModel.posterPath ?? ""
    productionCompanies = responseModel.productionCompanies ?? [ProductionCompany]()
    releaseDate = responseModel.releaseDate ?? ""
    revenue = responseModel.revenue ?? 0
    runtime = responseModel.runtime ?? 0
    spokenLanguages = responseModel.spokenLanguages ?? [SpokenLanguage]()
    status = responseModel.status  ?? ""
    tagline = responseModel.tagline ?? ""
    title = responseModel.title ?? ""
    video = responseModel.video ?? false
    voteAverage = responseModel.voteAverage ?? 0
    voteCount = responseModel.voteCount ?? 0
  }

}
