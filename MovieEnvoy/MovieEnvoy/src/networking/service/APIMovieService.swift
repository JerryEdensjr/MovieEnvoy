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

  func getMoviesNowPlaying(completion: @escaping (APIServiceResult<[MovieSummary]>) -> Void) {
    let request = Alamofire.request(MovieRouter.getMoviesNowPlaying)
    handleRequest(with: request, completion: completion)
  }

  func getPopularMovies(page: Int, completion: @escaping (_ reult: APIServiceResult<[MovieSummary]>, _ page: Int, _ totalPages: Int, _ totalResults: Int) -> Void) {
    let request = Alamofire.request(MovieRouter.getPopularMovies(page: page))

    request.responseData(queue: movieQueue) { [weak self] requestResponse in
        guard let self = self else { return }

      do {
        let data = requestResponse.data
        let response = try self.getResponse(from: data, responseType: GetPopularMovieResponseModel.self)

        DispatchQueue.main.async {
          completion(.success(response.results), response.page, response.totalPages, response.totalResults)
        }

      } catch {
        print(items: error.localizedDescription)
        completion(.failure(error), 0, 0, 0)
      }
    }
  }

  func getTopRatedMovies(page: Int, completion: @escaping (APIServiceResult<[MovieSummary]>, _ page: Int, _ totalPages: Int, _ totalResults: Int) -> Void) {
    let request = Alamofire.request(MovieRouter.getTopRatedMovies(page: page))

    request.responseData(queue: movieQueue) { [weak self] requestResponse in
        guard let self = self else { return }

      do {
        let data = requestResponse.data
        let response = try self.getResponse(from: data, responseType: GetTopRatedMoviesResponseModel.self)

        DispatchQueue.main.async {
          completion(.success(response.results), response.page, response.totalPages, response.totalResults)
        }

      } catch {
        print(items: error.localizedDescription)
        completion(.failure(error), 0, 0, 0)
      }
    }
  }

  func getUpcomingMovies(completion: @escaping (APIServiceResult<[MovieSummary]>) -> Void) {
    let request = Alamofire.request(MovieRouter.getUpcomingMovies)
    handleRequest(with: request, completion: completion)
  }

  func getMovieDetails(for movieID: Int, completion: @escaping (APIServiceResult<MovieDetail>) -> Void) {
//    let request = Alamofire.request(MovieRouter.)
  }

}

private extension APIService {
  private func handleRequest(with request: DataRequest, completion: @escaping (APIServiceResult<[MovieSummary]>) -> Void) {
    request.responseData(queue: movieQueue) { [weak self] requestResponse in
        guard let self = self else { return }

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
