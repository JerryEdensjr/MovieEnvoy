//
//  GetPopularMovieResponseModel.swift
//  MovieEnvoy
//

struct GetPopularMovieResponseModel: Decodable {

  let page: Int
  let totalPages: Int
  let totalResults: Int
  let results: [MovieSummary]?

  // error support
  let statusCode: Int?
  let statusMessage: String?
  let errors: [String]?

}
