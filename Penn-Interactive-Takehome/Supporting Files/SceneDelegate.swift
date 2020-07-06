//
//  SceneDelegate.swift
//  Penn-Interactive-Takehome
//
//  Created by Edmund Ng on 2020-06-29.
//  Copyright © 2020 EdNg. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  var coordinator: ModuleCoordinator!

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = configureCoordinator(windowScene: windowScene)
  }

  func sceneDidDisconnect(_ scene: UIScene) { }

  func sceneDidBecomeActive(_ scene: UIScene) { }

  func sceneWillResignActive(_ scene: UIScene) { }

  func sceneWillEnterForeground(_ scene: UIScene) { }

  func sceneDidEnterBackground(_ scene: UIScene) { }

}

extension SceneDelegate {
  private func configureCoordinator(windowScene: UIWindowScene) -> UIWindow {
    let navigationController = UINavigationController()
    coordinator = ModuleCoordinator(navigationController: navigationController)
    coordinator.start()

    let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window.windowScene = windowScene
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    return window
  }
}

