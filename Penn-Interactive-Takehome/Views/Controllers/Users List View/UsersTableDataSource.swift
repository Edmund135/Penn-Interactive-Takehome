//
//  UsersTableDatasource.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

class UserTableDataSource: NSObject, UITableViewDataSource {
  
  var userViewModels = [UserViewModel]()

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userViewModels.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PITUsersTableCell.reuseID, for: indexPath) as! PITUsersTableCell
    let userViewModel = userViewModels[indexPath.row]
    cell.userViewModel = userViewModel
    return cell
  }


}
