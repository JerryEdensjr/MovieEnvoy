//
//  ConfigurationService.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 5/22/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

protocol ConfigurationService {

  /// Retrieves the Movie DB configuration which, informs us of the sizes and changes names available.
  ///
  /// - Parameter completion: The closure that is called upon completion.
  /// - Returns: The result of the API call, returns a MovieDBConfig object, if successful.
  func getMovieDBConfiguration(completion: @escaping (_ result: APIServiceResult<MovieDBConfig>) -> Void)
}
