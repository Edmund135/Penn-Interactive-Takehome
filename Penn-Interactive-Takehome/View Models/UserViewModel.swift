//
//  UserViewModel.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

struct UserViewModel {

  private var user: User

  init(user: User) {
    self.user = user
  }

  var avatarImageURL: URL {
    return URL(string: user.avatarImageURL)!
  }

  var username: String {
    return user.displayName
  }

  var bronzeBadges: String {
    return "\(user.badgeCounts.bronze)"
  }

  var silverBadges: String {
    return "\(user.badgeCounts.silver)"
  }

  var goldBadges: String {
    return "\(user.badgeCounts.gold)"
  }


}
