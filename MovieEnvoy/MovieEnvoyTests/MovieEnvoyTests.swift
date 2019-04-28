//
//  MovieEnvoyTests.swift
//  MovieEnvoyTests
//
//  Created by Jerry Edens on 4/28/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import XCTest
import Alamofire

let TMDB_API_KEY = "68b13770194a73ff218ee6fae1f2c488"
let TMDB_BASE_URL = "https://api.themoviedb.org"
let TMDB_IMAGE_URL = "https://image.tmdb.org/t/p/w154"

class MovieEnvoyMovieAPITests: XCTestCase {

  private var timeOut: Double = 0.0

  override func setUp() {
    timeOut = 10.0
  }

  override func tearDown() {
  }

  func testGetMoviesNowPlaying() {
    self.measure {
      let expectation = XCTestExpectation(description: "Now Playing")
      APIService.shared.getMoviesNowPlaying { (result) in

        switch result {
        case .success(let movies):
          XCTAssert(movies.count > 0)
          expectation.fulfill()

        case .failure(let error):
          print(items: error.localizedDescription)
          XCTAssert(false)
          expectation.fulfill()
        }
      }

      wait(for: [expectation], timeout: timeOut)
    }
  }

  func testGetUpcomingMovies() {
    self.measure {
      let expectation = XCTestExpectation(description: "Upcoming Movies")
      APIService.shared.getUpcomingMovies { (result) in
        switch result {
        case .success(let movies):
          XCTAssert(movies.count > 0)
          expectation.fulfill()

        case .failure(let error):
          print(items: error.localizedDescription)
          XCTAssert(false)
          expectation.fulfill()
        }
      }

      wait(for: [expectation], timeout: timeOut)
    }
  }

  func testGetPopularMovies() {
    self.measure {
      let expectation = XCTestExpectation(description: "Popular Movies")
      /// Note: Page must be greater than 0
      APIService.shared.getPopularMovies(page: 1, completion: { (result, page, totalPages, totalResults) in
        switch result {
        case .success(let movies):
          XCTAssert(movies.count > 0)
          expectation.fulfill()

        case .failure(let error):
          print(items: error.localizedDescription)
          XCTAssert(false)
          expectation.fulfill()
        }
      })

      wait(for: [expectation], timeout: timeOut)
    }
  }

  func testGetTopRatedMovies() {
    self.measure {
      let expectation = XCTestExpectation(description: "Top Rated Movies")
      /// Note: Page must be greater than 0
      APIService.shared.getTopRatedMovies(page: 1, completion: { (result, page, totalPages, totalResults) in
        switch result {
        case .success(let movies):
          XCTAssert(movies.count > 0)
          expectation.fulfill()

        case .failure(let error):
          print(items: error.localizedDescription)
          XCTAssert(false)
          expectation.fulfill()
        }
      })

      wait(for: [expectation], timeout: timeOut)
    }
  }

  func testGetMovieDetail() {
    let movieID = 299534
    self.measure {
      let expectaion = XCTestExpectation(description: "Movie Detail \(movieID)")
      APIService.shared.getMovieDetails(for: movieID, completion: { (result) in
        switch result {
        case .success(let movieDetail):
          XCTAssert(movieDetail.id == movieID)
          expectaion.fulfill()

        case .failure(let error):
          print(items: error.localizedDescription)
          XCTAssert(false)
          expectaion.fulfill()
        }
      })

      wait(for: [expectaion], timeout: timeOut)
    }
  }

}
