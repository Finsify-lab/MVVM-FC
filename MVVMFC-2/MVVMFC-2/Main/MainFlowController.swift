//
//  MainFlowController.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/3/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class MainFlowController {
    var navigationController : UINavigationController!
    var viewController : MainViewController!
    var dependency: Dependency!
    
    init(navigationController: UINavigationController, viewController: MainViewController,dependency: Dependency) {
        self.navigationController = navigationController
        self.viewController = viewController
        self.dependency = dependency
    }
    //
    func showGitHub(url: String) {
        GitHubFactory.createIn(navigationController: navigationController,dependency: dependency, url: url)
    }
    func showSong(url: String) {
        SongFactory.createIn(navigationController: navigationController, dependency: dependency, url: url)
    }
    
    func showError() {
        InvalidFactory.createIn(navigationController: navigationController, dependency: dependency, url: "")
    }
}
