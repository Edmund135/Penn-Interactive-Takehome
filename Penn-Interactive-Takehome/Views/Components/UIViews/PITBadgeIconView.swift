//
//  BadgeView.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

enum BadgeType {
  case bronze, silver, gold
}

final class PITBadgeIconView: UIView {

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  convenience init(badgeType: BadgeType) {
    self.init(frame: .zero)

    switch badgeType {
    case .bronze:
      backgroundColor = UIColor(red: 209/255, green: 166/255, blue: 132/255, alpha: 1.0)
    case .silver:
      backgroundColor = UIColor(red: 180/255, green: 184/255, blue: 188/255, alpha: 1.0)
    case .gold:
      backgroundColor = UIColor(red: 251/255, green: 204/255, blue: 5/255, alpha: 1.0)
    } 

  }

  private func configure() {
    layer.cornerRadius = 5.0
    clipsToBounds = true
    translatesAutoresizingMaskIntoConstraints = false 
  }
}

