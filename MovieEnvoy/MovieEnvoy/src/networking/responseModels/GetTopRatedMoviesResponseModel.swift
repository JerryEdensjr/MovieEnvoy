//
//  GetTopRatedMoviesResponseModel.swift
//  MovieEnvoy
//

struct GetTopRatedMoviesResponseModel: Codable {

  let page: Int
  let totalPages: Int
  let totalResults: Int
  let results: [MovieSummary]
}
