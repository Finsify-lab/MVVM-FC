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
    var dependency: Dependency!
    
    init(navigationController: UINavigationController,dependency: Dependency) {
        self.navigationController = navigationController
        self.dependency = dependency
    }
    
    func showDetail(url: String) {
        DetailFactory.pushIn(navigationController: navigationController, dependence: dependency, url: url)
    }
}
