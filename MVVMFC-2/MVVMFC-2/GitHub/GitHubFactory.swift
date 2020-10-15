//
//  DetailFactory.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/3/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class GitHubFactory {
    static func createIn(navigationController: UINavigationController,dependency: Dependency ,url: String){
        
        let viewController = GitHubViewController()
        
        let flowController = GitHubFlowController(navigationController: navigationController, dependency: dependency)
        
        let viewModel = GitHubViewModel(flowController: flowController, swapi: dependency.swapi)
        
        
        viewController.title = "GitHubView"
        viewController.viewModel = viewModel
        viewModel.urlStr = url
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
