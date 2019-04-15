//
//  MovieViewModel.swift
//  MovieEnvoy
//

final class MovieViewModel {

  private(set) var movies = [Movie]()

  private var mode: APIEndpoint = .nowPlaying

  private var currentPage: Int = 0
  private var totalPages: Int = 0
  private var totalResults: Int = 0

  private func configure(with responseModel: GetPopularMovieResponseModel) {
    currentPage = responseModel.page
    totalPages = responseModel.totalPages
    totalResults = responseModel.totalResults
    movies = responseModel.results
  }

  private func configure(with response: (movies: [Movie], page: Int, totalPages: Int, totalResults: Int)) {
    self.movies = response.movies
    self.currentPage = response.page
    self.totalPages = response.totalPages
    self.totalResults = response.totalResults
  }

  private func configure(with movies: [Movie]) {
    self.movies = movies
  }

}

extension MovieViewModel {
  func getMovies(with endpoint: APIEndpoint, completion: @escaping () -> Void) {

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

    mode = endpoint

    switch endpoint {
    case .nowPlaying:
      APIService.shared.getMoviesNowPlaying { (result) in
        handleResult(result: result)
      }

    case .popular:
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
      APIService.shared.getTopRatedMovies { (result) in
        handleResult(result: result)
      }

    case .upcoming:
      APIService.shared.getUpcomingMovies { (result) in
        handleResult(result: result)
      }
    }
  }

}
