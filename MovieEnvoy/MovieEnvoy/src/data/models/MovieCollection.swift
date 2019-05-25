//
//  MovieCollection.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/27/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

final class MovieCollection: Decodable {
  let id: Int
  let name: String?
  let posterPath: String?
  let backdropPath: String?

    init() {
        id = 0
        name = nil
        posterPath = nil
        backdropPath = nil
    }

    init(from responseModel: GetMoviesDetailResponse) {
    id = responseModel.belongsToCollection?.id ?? 0
    name = responseModel.belongsToCollection?.name
    posterPath = responseModel.belongsToCollection?.posterPath
    backdropPath = responseModel.belongsToCollection?.backdropPath
  }

}
