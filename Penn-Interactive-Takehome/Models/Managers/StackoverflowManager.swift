//
//  StackoverflowManager.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

final class StackoverflowManager: NetworkingManager {

  func getUsers(completed: @escaping ([User]) -> Void) {
    let request = NetworkRequest(method: .get, path: "users")
    request.queryItems = [URLQueryItem(name:"page", value: "1"), URLQueryItem(name: "site", value: "stackoverflow")]

    NetworkingManager().request(request) { error, data, response in
      guard error == nil, let data = data else { return }
      let userData = try? JSONDecoder().decode(StackoverflowRoot.self, from: data)
      if let users = userData?.users {
        completed(users)
      }
    }
  }

}
