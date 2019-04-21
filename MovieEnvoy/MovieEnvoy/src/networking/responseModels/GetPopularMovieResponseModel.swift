//
//  GetPopularMovieResponseModel.swift
//  MovieEnvoy
//

struct GetPopularMovieResponseModel: Codable {

  let page: Int
  let totalPages: Int
  let totalResults: Int
  let results: [Movie]
}
