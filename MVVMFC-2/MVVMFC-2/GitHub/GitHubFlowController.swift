//
//  DetailFlowController.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/3/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class GitHubFlowController {
    var navigationController : UINavigationController!
    var viewController: GitHubViewController!
    var dependency: Dependency!
    
    init(navigationController: UINavigationController,viewController: GitHubViewController,dependency: Dependency) {
        self.navigationController = navigationController
        self.viewController = viewController
        self.dependency = dependency
    }
    
    func showDetail() {
        DetailFactory.pushIn(navigationController: navigationController, dependence: dependency, parentViewModel: viewController.viewModel)
    }
}
