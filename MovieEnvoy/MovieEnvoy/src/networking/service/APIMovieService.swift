//
//  APIMovieService.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Alamofire

private let movieQueue = DispatchQueue(label: "MovieEnvoyMovieQueue", qos: .userInitiated, attributes: .concurrent)

extension APIService: MovieService {

  func getMoviesNowPlaying(completion: @escaping (APIServiceResult<[Movie]>) -> Void) {
    let request = Alamofire.request(MovieRouter.getMoviesNowPlaying)

    request.responseData(queue: movieQueue) { responseData in
      do {
        let data = responseData.data
        let response = try self.getResponse(from: data, responseType: GetMovieResponseModel.self)

        DispatchQueue.main.async {
          completion(.success(response.results))
        }

      } catch {
        print(items: error.localizedDescription)
        DispatchQueue.main.async {
          completion(.failure(error))
        }
      }
    }
  }

  func getPopularMovies(completion: @escaping (APIServiceResult<[Movie]>) -> Void) {

  }

  func getTopRatedMovies(completion: @escaping (APIServiceResult<[Movie]>) -> Void) {

  }

  func getUpcomingMovies(completion: @escaping (APIServiceResult<[Movie]>) -> Void) {

  }

}
