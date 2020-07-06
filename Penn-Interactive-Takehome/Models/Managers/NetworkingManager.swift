//
//  NetworkingManager.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
  case get = "GET"
}

struct HTTPHeader {
  let field: String
  let value: String
}

class NetworkRequest {
  let method: HTTPMethod
  let path: String
  var queryItems: [URLQueryItem]?
  var headers: [HTTPHeader]?
  var body: Data?

  init(method: HTTPMethod, path: String) {
    self.method = method
    self.path = path
  }
}

enum APIError: Error {
  case invalidURL
  case requestFailed
}

class NetworkingManager {

  typealias NetworkingCompletion = (APIError?, Data?, HTTPURLResponse?) -> Void

  private let session = URLSession.shared
  private let baseURL = URL(string: APIBaseURL.Stackoverflow)!

  func request(_ request: NetworkRequest, _ completion: @escaping NetworkingCompletion) {

    var urlComponents = URLComponents()
    urlComponents.scheme = baseURL.scheme
    urlComponents.host = baseURL.host
    urlComponents.path = baseURL.path
    urlComponents.queryItems = request.queryItems

    guard let url = urlComponents.url?.appendingPathComponent(request.path) else {
      completion(.invalidURL, nil, nil)
      return
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = request.method.rawValue
    urlRequest.httpBody = request.body

    request.headers?.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.field) }

    let task = session.dataTask(with: url) { (data, response, error) in
      guard let httpResponse = response as? HTTPURLResponse else {
        completion(.requestFailed, nil, nil)
        return
      }
      completion(nil, data, httpResponse)
    }
    task.resume()
  }
}
