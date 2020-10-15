//
//  InvalidFactory.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/14/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class InvalidFactory {
    static func createIn(navigationController: UINavigationController,dependency: Dependency ,url: String){
        let viewController = InvalidViewController()
        viewController.title = "InvalidView"
        
        let flowController = InvalidFlowController(navigationController: navigationController, viewController: viewController, dependency: dependency)
        
        let viewModel = InvalidViewModel(flowController: flowController,swapi: dependency.swapi)
        
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
