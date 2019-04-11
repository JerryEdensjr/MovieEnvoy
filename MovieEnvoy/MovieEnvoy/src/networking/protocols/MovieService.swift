//
//  MovieService.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

protocol MovieService {
  func getMovisNowPlaying(@escaping completion: (Result<[Movie]>))
}
