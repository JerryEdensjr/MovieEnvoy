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
    
  }

}
