//
//  APIClient.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 11/14/18.
//  Copyright © 2018 Edens R&D. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {

  /// Used for singleton
  static let sharedInstance = APIClient()

  // MARK: properties
  fileprivate let manager: Alamofire.SessionManager

  fileprivate init() {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders

    self.manager = Alamofire.SessionManager(configuration: configuration)
  }

  /// This function will get a list of movies back filtered by the endpoint.
  /// This api's support paging, however for this short example there is not
  /// a requirement to support paging.
  func request(_ endpoint: Endpoint, _ page: Int = 1, completion: @escaping (([Movie]?) -> Void)) {

    let url = URL(string: endpoint.path + "&page=\(page)")
    let headers = [String:String]()

    Alamofire.request(url!, method: endpoint.method, parameters: nil, encoding: JSONEncoding.default, headers: headers)
      .validate()
      .responseJSON { (response) in

        if response.result.isFailure == true {
          completion(nil)
        } else {

          if let result = response.result.value as? [String: Any] {
            let results = result["results"] as! NSArray

            var movies = [Movie]()
            let decoder = JSONDecoder()

            for movieDict in results {
              if let movieDict = movieDict as? [String: Any] {
                if let movieData = try? JSONSerialization.data(withJSONObject: movieDict, options: .prettyPrinted) {
                  if let movie = try? decoder.decode(Movie.self, from: movieData) {
                    movies.append(movie)
                  }
                }
              }
            }
            completion(movies)
          }
        }
    }
  }
}
