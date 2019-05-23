//
//  APIConfigurationService.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 5/22/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Alamofire

private let configurationQueue = DispatchQueue(label: "MovieEnvoyConfigurationQueue", qos: .userInitiated, attributes: .concurrent)

extension APIService: ConfigurationService {
  func getMovieDBConfiguration(completion: @escaping (APIServiceResult<MovieDBConfig>) -> Void) {
    let request = Alamofire.request(ConfigurationRouter.GetMovieDBConfiguration)

    request.responseData(queue: configurationQueue) { [weak self] requestResponse in
      guard let self = self else { return }

      do {
        let data = requestResponse.data
        let response = try self.getResponse(from: data, responseType: GetMovieDBConfigResponseModel.self)

        let movieDBConfig = MovieDBConfig(with: response)

        DispatchQueue.main.async {
          completion(.success(movieDBConfig))
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
