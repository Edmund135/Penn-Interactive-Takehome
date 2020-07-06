//
//  UITableView+Extensions.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

extension UITableView {

  func reloadDataOnMainThread() {
    DispatchQueue.main.async { self.reloadData() }
  }

  func removeExcessCells() {
    tableFooterView = UIView(frame: .zero)
  }

}
