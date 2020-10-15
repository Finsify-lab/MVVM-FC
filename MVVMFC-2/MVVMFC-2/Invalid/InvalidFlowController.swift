//
//  InvalidFlowController.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/14/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit


class InvalidFlowController {
    var navigationController : UINavigationController!
    var viewController: InvalidViewController!
    var dependency: Dependency!

    init(navigationController: UINavigationController, viewController: InvalidViewController,dependency: Dependency) {
        self.navigationController = navigationController
        self.viewController = viewController
        self.dependency = dependency
    }
}

