//
//  MovieDetail.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/27/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

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

  init(with responseModel: GetMoviesDetailResponse) {
    id = responseModel.id
    imdbId = responseModel.imdbId

    adult = responseModel.adult
    backdropPath = responseModel.backdropPath
    belongsToCollection = responseModel.belongsToCollection
    budget = responseModel.budget
    genres = responseModel.genres
    homepage = responseModel.homepage
    originalLanguage = responseModel.originalLanguage
    originalTitle = responseModel.originalTitle
    overview = responseModel.overview
    popularity = responseModel.popularity
    posterPath = responseModel.posterPath
    productionCompanies = responseModel.productionCompanies
    releaseDate = responseModel.releaseDate
    revenue = responseModel.revenue
    runtime = responseModel.runtime
    spokenLanguages = responseModel.spokenLanguages
    status = responseModel.status
    tagline = responseModel.tagline
    title = responseModel.title
    video = responseModel.video
    voteAverage = responseModel.voteAverage
    voteCount = responseModel.voteCount
  }

}
