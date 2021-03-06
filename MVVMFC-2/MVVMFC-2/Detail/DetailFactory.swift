//
//  DetailViewFactory.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class DetailFactory {
    static func pushIn(navigationController: UINavigationController,dependence: Dependency, parentViewModel: GitHubViewModelType?) {
        
        let viewController = DetailViewController()
        
        let flowController = DetailFlowController(navigationController: navigationController)
        
        let viewModel = DetailViewModel(flowController: flowController,swapi: dependence.swapi)
        
        viewModel.datasource = parentViewModel
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    static func pushFromDeepLink(navigationController: UINavigationController,dependence: Dependency,url: String?) {
        
        let viewController = DetailViewController()
        
        let flowController = DetailFlowController(navigationController: navigationController)
        
        let viewModel = DetailViewModel(flowController: flowController,swapi: dependence.swapi)
        
        
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}

