//
//  ModuleCoordinator.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-30.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

protocol Coordinator {
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }

  func start()
}

class ModuleCoordinator: Coordinator {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    self.navigationController.navigationBar.prefersLargeTitles = true 
  }

  func start() {
    let usersViewcontroller = UsersVC()
    usersViewcontroller.coordinator = self
    usersViewcontroller.stackoverflowManager = StackoverflowManager()
    usersViewcontroller.title = "Stackoverflow Users"
    usersViewcontroller.view.backgroundColor = .systemBackground
    navigationController.pushViewController(usersViewcontroller, animated: false)
  }

}
