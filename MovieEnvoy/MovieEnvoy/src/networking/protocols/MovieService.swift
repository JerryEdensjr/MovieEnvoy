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
  /// - Parameter completion: The result of the API call, returns an array of Movie objects if successful.
  func getMoviesNowPlaying(completion: @escaping (_ result: APIServiceResult<[Movie]>) -> Void)

  /// Get a list of popular movies.
  ///
  /// - Parameter completion: The result of the API call, returns an array of Movie objects if successful.
  func getPopularMovies(completion: @escaping (_ result: APIServiceResult<[Movie]>) -> Void)

  /// Get a list of top rated movies.
  ///
  /// - Parameter completion: The result of the API call, returns an array of Movie objects if successful.
  func getTopRatedMovies(completion: @escaping (_ result: APIServiceResult<[Movie]>) -> Void)

  /// Get a list of upcoming movies.
  ///
  /// - Parameter completion: The result of the API call, returns an array of Movie objects if successful.
  func getUpcomingMovies(completion: @escaping (_ result: APIServiceResult<[Movie]>) -> Void)

}
