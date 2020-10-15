//
//  MainFactory.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/3/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class MainFactory {
    static func rootIn(navigationController: UINavigationController, dependency: Dependency) {
        let view = MainViewController()
        view.title = "Main View"
        
        let flowController = MainFlowController(navigationController: navigationController, viewController: view, dependency: dependency)
        
        let viewModel = MainViewModel(flowController: flowController,swapi: dependency.swapi)
        
        view.viewModel = viewModel
        
        // gán giá trị cho tất cả các biến xong mới gọi đến viewDidLoad()
        navigationController.viewControllers = [view]
    }
}
