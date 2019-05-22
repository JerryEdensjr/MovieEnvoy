//
//  GetMovieDBConfigResponseModel.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 5/22/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

struct MDBImages: Decodable {
  let baseUrl: String
  let secureBaseUrl: String
  let backdropSizes: [String]
  let logoSizes: [String]
  let posterSizes: [String]
  let profileSizes: [String]
  let stillSizes: [String]

}

struct GetMovieDBConfigResponseModel: Decodable {
  let images: MDBImages

}
