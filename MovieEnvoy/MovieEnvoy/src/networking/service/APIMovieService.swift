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
    handleRequest(with: request, completion: completion)
  }

  func getPopularMovies(completion: @escaping (APIServiceResult<[Movie]>) -> Void) {
    let request = Alamofire.request(MovieRouter.getPopularMovies)
    handleRequest(with: request, completion: completion)
  }

  func getTopRatedMovies(completion: @escaping (APIServiceResult<[Movie]>) -> Void) {
    let request = Alamofire.request(MovieRouter.getTopRatedMovies)
    handleRequest(with: request, completion: completion)
  }

  func getUpcomingMovies(completion: @escaping (APIServiceResult<[Movie]>) -> Void) {
    let request = Alamofire.request(MovieRouter.getUpcomingMovies)
    handleRequest(with: request, completion: completion)
  }

}

private extension APIService {
  private func handleRequest(with request: DataRequest, completion: @escaping (APIServiceResult<[Movie]>) -> Void) {
    request.responseData(queue: movieQueue) { requestResponse in
      do {
        let data = requestResponse.data
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

}
