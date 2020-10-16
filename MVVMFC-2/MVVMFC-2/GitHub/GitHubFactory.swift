//
//  DetailFactory.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/3/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class GitHubFactory {
    static func createIn(navigationController: UINavigationController,dependency: Dependency ,datasource: SubMainViewModelDatasource?,parentViewModel: MainViewModelType){
        
        let viewController = GitHubViewController()
        
        let flowController = GitHubFlowController(navigationController: navigationController, viewController: viewController, dependency: dependency)
        
        let viewModel = GitHubViewModel(flowController: flowController, swapi: dependency.swapi)
        viewModel.datasource = parentViewModel
        
        viewController.title = "GitHubView"
        viewController.viewModel = viewModel
        
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
