//
//  EndpointRouter.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Alamofire

protocol EndpointRouter: URLRequestConvertible {
  typealias RequestComponents = (method: HTTPMethod, path: String, params: Parameters?, apiVersion: APIVersion)
  var components: RequestComponents { get }
}

enum APIVersion {
  case v1

  var baseURL: String {
    guard let context = APIService.context else {
      fatalError("Context is not set")
    }

    switch self {
    case .v1:
      return context.baseURLString
    }
  }

//  var imageBaseURL: String {
//    guard let context = APIService.context else {
//      fatalError("Context is not set.")
//    }
//
//    if let url = MovieDBContext.shared.getBaseURL(for: .v1) {
//      return url
//    }
//
//    return ""
//  }

}

extension EndpointRouter {
  func asURLRequest() throws -> URLRequest {
    let urlComponents = components
    let urlString = urlComponents.apiVersion.baseURL

    let url = try urlString.asURL()

    var urlRequest = URLRequest(url: url.appendingPathComponent(urlComponents.path))

    urlRequest.httpMethod = urlComponents.method.rawValue
    urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

    let requestEncoder: ParameterEncoding

    switch urlComponents.method {
    case .delete, .get:
      requestEncoder = URLEncoding.queryString
    default:
      urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
      requestEncoder = JSONEncoding.default
    }

    return try requestEncoder.encode(urlRequest, with: urlComponents.params)
  }
}
