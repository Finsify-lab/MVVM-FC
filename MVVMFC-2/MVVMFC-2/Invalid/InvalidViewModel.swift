//
//  InvalidViewModel.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/14/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation


class InvalidViewModel {
    var flowController: InvalidFlowController!
    var swapi: ResponseAPI!
    
    init(flowController: InvalidFlowController,swapi: ResponseAPI) {
        self.flowController = flowController
        self.swapi = swapi
    }
}
