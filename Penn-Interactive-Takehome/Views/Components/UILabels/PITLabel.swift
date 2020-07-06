//
//  UsernameLabel.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

final class PITLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  convenience init(textAlignment: NSTextAlignment, font: CGFloat, textColor: UIColor) {
    self.init(frame: .zero)
    self.textAlignment = textAlignment
    self.font = .systemFont(ofSize: font)
    self.textColor = textColor
  }

  private func configure() {
    numberOfLines = 0
    lineBreakMode = .byTruncatingTail
    translatesAutoresizingMaskIntoConstraints = false
  }

}
