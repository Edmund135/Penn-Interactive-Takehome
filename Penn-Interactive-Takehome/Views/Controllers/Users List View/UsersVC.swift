//
//  UsersViewController.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

class UsersVC: PITDataLoadingVC {

  weak var coordinator: ModuleCoordinator?

  var stackoverflowManager: StackoverflowManager?

  var userViewModels = [UserViewModel]()

  lazy var usersTableView = UITableView()
  let usersTableViewDataSource = UserTableDataSource()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(usersTableView)
    configureTableView()
    getUsers()
  }

  private func getUsers() {
    presentLoadingView()
    stackoverflowManager?.getUsers { [weak self] users in
      guard let self = self else { return }
      self.userViewModels = users.map({ return UserViewModel(user: $0)})
      self.usersTableViewDataSource.userViewModels = self.userViewModels
      self.usersTableView.reloadDataOnMainThread()
      self.dismissLoadingView()
    }
  }

  private func configureTableView() {
    usersTableView.allowsSelection = false
    usersTableView.frame = view.bounds
    usersTableView.rowHeight = 100.0
    usersTableView.dataSource = usersTableViewDataSource
    usersTableView.register(PITUsersTableCell.self, forCellReuseIdentifier: PITUsersTableCell.reuseID)
  }

}

