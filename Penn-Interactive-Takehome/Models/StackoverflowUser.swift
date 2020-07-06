//
//  StackoverflowUser.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import Foundation

struct StackoverflowRoot: Decodable {
  let users: [User]

  enum CodingKeys: String, CodingKey {
    case users = "items"
  }
}

struct User: Decodable {
  let badgeCounts: BadgeCounts
  let avatarImageURL: String
  let displayName: String

  enum CodingKeys: String, CodingKey {
    case badgeCounts = "badge_counts"
    case avatarImageURL = "profile_image"
    case displayName = "display_name"
  }
}

struct BadgeCounts: Decodable {
  let bronze: Int
  let silver: Int
  let gold: Int
}
