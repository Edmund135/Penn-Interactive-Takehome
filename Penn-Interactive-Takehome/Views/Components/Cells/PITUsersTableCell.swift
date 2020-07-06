//
//  UsersTableCell.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit
import Kingfisher

final class PITUsersTableCell: UITableViewCell {

  static let reuseID  = "UsersTableCell"

  var userViewModel: UserViewModel! {
    didSet {
      avatarImageView.kf.setImage(with: userViewModel.avatarImageURL)
      usernameLabel.text = userViewModel.username
      goldBadgesLabel.text = userViewModel.goldBadges
      silverBadgesLabel.text = userViewModel.silverBadges
      bronzeBadgesLabel.text = userViewModel.bronzeBadges
    }
  }

  private let avatarImageView = PITAvatarImageView(frame: .zero)

  private let usernameLabel = PITLabel(textAlignment: .left, font: 16.0, textColor: .label)

  private lazy var goldBadgeIcon = PITBadgeIconView(badgeType: .gold)
  private lazy var goldBadgesLabel = PITLabel(textAlignment: .left, font: 10.0, textColor: .secondaryLabel)

  private lazy var silverBadgeIcon = PITBadgeIconView(badgeType: .silver)
  private lazy var silverBadgesLabel = PITLabel(textAlignment: .left, font: 10.0, textColor: .secondaryLabel)

  private lazy var bronzeBadgeIcon = PITBadgeIconView(badgeType: .bronze)
  private lazy var bronzeBadgesLabel = PITLabel(textAlignment: .left, font: 10.0, textColor: .secondaryLabel)

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubviews()
    applyAutoLayoutConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addSubviews() {
    addSubviews(avatarImageView, usernameLabel, goldBadgeIcon, goldBadgesLabel, silverBadgeIcon, silverBadgesLabel, bronzeBadgeIcon, bronzeBadgesLabel)
  }

  private func applyAutoLayoutConstraints() {
    let badges = [goldBadgeIcon, silverBadgeIcon, bronzeBadgeIcon]
    let badgeLabels = [goldBadgesLabel, silverBadgesLabel, bronzeBadgesLabel]

    let padding: CGFloat  = 12

    NSLayoutConstraint.activate([
      avatarImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
      avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
      avatarImageView.heightAnchor.constraint(equalToConstant: 60.0),
      avatarImageView.widthAnchor.constraint(equalToConstant: 60.0),

      usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: padding),
      usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
      usernameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
      usernameLabel.heightAnchor.constraint(equalToConstant: 20.0),

      goldBadgeIcon.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
      goldBadgesLabel.leadingAnchor.constraint(equalTo: goldBadgeIcon.trailingAnchor, constant: padding/4),

      silverBadgeIcon.leadingAnchor.constraint(equalTo: goldBadgesLabel.trailingAnchor, constant: padding/2),
      silverBadgesLabel.leadingAnchor.constraint(equalTo: silverBadgeIcon.trailingAnchor, constant: padding/4),

      bronzeBadgeIcon.leadingAnchor.constraint(equalTo: silverBadgesLabel.trailingAnchor, constant: padding/2),
      bronzeBadgesLabel.leadingAnchor.constraint(equalTo: bronzeBadgeIcon.trailingAnchor, constant: padding/4),
    ])

    badges.forEach { badge in
      NSLayoutConstraint.activate([
        badge.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: padding),
        badge.widthAnchor.constraint(equalToConstant: 10.0),
        badge.heightAnchor.constraint(equalToConstant: 10.0),
      ])
    }

    badgeLabels.forEach { badgeLabel in
      NSLayoutConstraint.activate([
        badgeLabel.centerYAnchor.constraint(equalTo: goldBadgeIcon.centerYAnchor),
        badgeLabel.widthAnchor.constraint(equalToConstant: 30.0),
        badgeLabel.heightAnchor.constraint(equalToConstant: 20.0),
      ])
    }

  }

}

