//
//  MovieService.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

protocol MovieService {
  /// Get a list of movies that are now playing in the theaters.
  ///
  /// - Parameters:
  ///   - page: The page to return.
  ///   - completion: The closure that is called upon completion.
  /// - Returns: The result of the API call, returns an array of Movie objects if successful.
  func getMoviesNowPlaying(completion: @escaping (_ result: APIServiceResult<[MovieSummary]>) -> Void)

  /// Get a list of popular movies.
  ///
  /// - Parameters:
  ///   - page: The page to return.
  ///   - completion: The closure that is called upon completion.
  /// - Returns: The result of the API call, returns an array of Movie objects if successful.
  func getPopularMovies(page: Int, completion: @escaping (_ result: APIServiceResult<[MovieSummary]>, _ page: Int, _ totalPages: Int, _ totalResults: Int) -> Void)

  /// Get a list of top rated movies.
  ///
  /// - Parameters:
  ///   - page: The page to return.
  ///   - completion: The closure that is called upon completion.
  /// - Returns: The result of the API call, returns an array of Movie objects if successful.
  func getTopRatedMovies(page: Int, completion: @escaping (_ result: APIServiceResult<[MovieSummary]>, _ page: Int, _ totalPages: Int, _ totalResults: Int) -> Void)

  /// Get a list of upcoming movies.
  ///
  /// - Parameters:
  ///   - page: The page to return.
  ///   - completion: The closure that is called upon completion.
  /// - Returns: The result of the API call, returns an array of Movie objects if successful.
  func getUpcomingMovies(completion: @escaping (_ result: APIServiceResult<[MovieSummary]>) -> Void)

  /// Retrieves the detail information for the movie.
  ///
  /// - Parameters:
  ///   - movieID: The id of the movie for which to get the details.
  ///   - completion: The closure that is called upon completion.
  /// - Returns: The result of the API call, return a MovieDetail object if successful.
  func getMovieDetails(for movieID: Int, completion: @escaping (_ result: APIServiceResult<MovieDetail>) -> Void)

}
