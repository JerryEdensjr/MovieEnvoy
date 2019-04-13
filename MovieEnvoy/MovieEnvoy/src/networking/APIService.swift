//
//  APIService.swift
//  MovieEnvoy
//
//  Created by Jerry Edens on 4/11/19.
//  Copyright © 2019 Edens R&D. All rights reserved.
//

import Alamofire
import PromiseKit

private let queue = DispatchQueue(label: "APIServiceQueue", qos: .userInitiated, attributes: .concurrent)

public class APIService {
  static var context: APIServiceContext!
  static let shared = APIService()

  private enum Defaults {
    static let environment: APIServiceContext = {
      #if AppStore
      return APIServiceContext(with: "production")
      #else
      return APIServiceContext(with: "staging")
      #endif
    }()
  }

  private init(environment: APIServiceContext = Defaults.environment) {
    APIService.context = environment
  }

  var shouldReloadExplore: Bool = true

  /// Get decoded JSON response from Alamofire network request.
  ///
  /// - Parameters:
  ///   - data: Data returned from Alamofire network request
  ///   - responseType: The decodable response type to parse the JSON correctly
  /// - Returns: An object containing the decoded response if successful
  func getResponse<T: Decodable>(from responseData: Data?, responseType: T.Type) throws -> T {
    guard let data = responseData else { throw APIError.unrecognized }

    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    do {
      let response = try decoder.decode(responseType, from: data)
      return response
    } catch let error {
      print(items: error, String(data: data, encoding: .utf8) as Any)
      //#warning("REMOVE DEBUG CODE")
      //raise(SIGINT)
      throw APIError.decodeError
    }
  }
}

// MARK: APIService State
extension APIService {
  var deviceID: String? { return UIDevice.current.identifierForVendor?.uuidString }
}

public enum APIServiceResult<T> {
  case success(T)
  case failure(Error)
}

extension DataRequest {
  func clResponseDecodable<T: Decodable>() -> Promise<T> {
    return responseDecodable(T.self)
  }

  func clResponseDecodable<T: Decodable>(_ type: T.Type) -> Promise<T> {
    return Promise { seal in
      responseData { response in
        switch response.result {
        case .success(let data):
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase

          do {
            let response = try decoder.decode(type, from: data)
            seal.fulfill(response)
          } catch let error {
            print(items: error)
            seal.reject(APIError.decodeError)
          }
        case .failure(let error):
          seal.reject(error)
        }
      }
    }
  }
}

