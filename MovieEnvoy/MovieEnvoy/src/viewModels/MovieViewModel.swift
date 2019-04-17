//
//  MovieViewModel.swift
//  MovieEnvoy
//

import UIKit

final class MovieViewModel: NSObject {

  private(set) var movies = [Movie]()

  private var currentPage: Int = 0
  private var totalPages: Int = 0
  private var totalResults: Int = 0

  private func configure(with responseModel: GetPopularMovieResponseModel) {
    currentPage = responseModel.page
    totalPages = responseModel.totalPages
    totalResults = responseModel.totalResults
    movies.append(contentsOf: responseModel.results)
  }

  private func configure(with response: (movies: [Movie], page: Int, totalPages: Int, totalResults: Int)) {
    self.movies.append(contentsOf: response.movies)
    self.currentPage = response.page
    self.totalPages = response.totalPages
    self.totalResults = response.totalResults
  }

  private func configure(with movies: [Movie]) {
    self.movies.append(contentsOf: movies)
  }

  override var debugDescription: String {
    return super.description + " numberOfCachedMovies: \(movies.count), currentPage: \(currentPage), totalPage: \(totalPages), totalResults: \(totalResults)"
  }

}

extension MovieViewModel {
  func getMoviesPlayingNow(completion: @escaping () -> Void) {
    getMovies(with: .nowPlaying) {
      completion()
    }
  }

  func getPopularMovies(completion: @escaping () -> Void) {
    getMovies(with: .popular) {
      completion()
    }
  }

  func getNextPageOfPopularMovies(completion: @escaping () -> Void) {
    getMovies(with: .popular) {
      completion()
    }
  }

  func getTopRatedMovies(completion: @escaping () -> Void) {
    getMovies(with: .topRated) {
      completion()
    }
  }

  func getNextPageOfTopRatedMovies(completion: @escaping () -> Void) {
    getMovies(with: .topRated) {
      completion()
    }
  }

  func getUpcomingMovies(completion: @escaping () -> Void) {
    getMovies(with: .upcoming) {
      completion()
    }
  }

  private func getMovies(with endpoint: APIEndpoint, completion: @escaping () -> Void) {

    func handleResult(result: APIServiceResult<[Movie]>) {
      switch result {
      case let .success(movies):
        configure(with: movies)
        completion()

      case let .failure(error):
        print(items: error.localizedDescription)
        completion()
      }
    }

    switch endpoint {
    case .nowPlaying:
      reset()
      APIService.shared.getMoviesNowPlaying { (result) in
        handleResult(result: result)
      }

    case .popular:
      if currentPage == 0 {
        movies = [Movie]()
      }
      currentPage += 1
      APIService.shared.getPopularMovies(page: currentPage) { [weak self] (result, page, totalPages, totalResults) in
        guard let self = self else { return }

        handleResult(result: result)

        switch result {
        case .success(let movies):
          self.configure(with: (movies, page, totalPages, totalResults))
          completion()

        case .failure(let error):
          print(items: error.localizedDescription)
          completion()
        }
      }

    case .topRated:
      reset()
      APIService.shared.getTopRatedMovies { [weak self] (result, page, totalPages, totalResults) in
        handleResult(result: result)

        switch result {
        case .success(let movies):
          self.configure(with: (movies, page, totalPages, totalResults))
          completion()

        case .failure(let error):
          print(items: error.localizedDescription)
          completion()
        }
      }

    case .upcoming:
      reset()
      APIService.shared.getUpcomingMovies { (result) in
        handleResult(result: result)
      }
    }
  }

  private func reset() {
    movies = [Movie]()
    currentPage = 0
  }
}

extension MovieViewModel: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.cellIdentifier()) as? MovieInfoTableViewCell {
      let movie = self.movies[indexPath.row]
      cell.configure(with: movie)
      return cell
    }

    return UITableViewCell()
  }

}
