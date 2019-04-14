//
//  APIError.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Foundation

enum APIError: Error {
  case decodeError
  case invalidParameter
  case messageForUser(message: String)
  case unrecognized
}

extension APIError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case let .messageForUser(message):
      return message
    default:
      return "We're sorry, we have encountered an issue. Please try again."
    }
  }
}
