//
//  AvatarImageView.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

final class PITAvatarImageView: UIImageView {

  override init(frame: CGRect) {
    super.init(frame:frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    layer.cornerRadius = 10
    clipsToBounds = true
    translatesAutoresizingMaskIntoConstraints = false
  }

}
