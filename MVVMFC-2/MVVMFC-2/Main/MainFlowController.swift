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
    func showGitHub(datasouce: SubMainViewModelDatasource?) {
        GitHubFactory.createIn(navigationController: navigationController,dependency: dependency, datasource: datasouce, parentViewModel: viewController.viewModel)
    }
    func showSong(datasouce: SubMainViewModelDatasource?) {
        SongFactory.createIn(navigationController: navigationController, dependency: dependency, datasource: datasouce,parentViewModel: viewController.viewModel)
    }
    
    func showError() {
        InvalidFactory.createIn(navigationController: navigationController, dependency: dependency,datasource: nil)
    }
}
