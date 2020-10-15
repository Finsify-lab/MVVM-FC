//
//  SongFactory.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/14/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class SongFactory {
    static func createIn(navigationController: UINavigationController,dependency: Dependency ,url: String){
        let viewController = SongViewController()
        viewController.title = "SongView"
        
        let flowController = SongViewFlowController(navigationController: navigationController, viewController: viewController, dependency: dependency)
        
        let viewModel = SongViewModel(flowController: flowController, swapi: dependency.swapi)
        
        viewController.viewModel = viewModel
        viewModel.url = url
        
        navigationController.pushViewController(viewController, animated: true)
    }
}

