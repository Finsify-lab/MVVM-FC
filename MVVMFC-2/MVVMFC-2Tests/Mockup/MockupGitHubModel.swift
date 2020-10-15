//
//  MockupGitHubModel.swift
//  MVVMFC-2Tests
//
//  Created by Lê Hoàng Sinh on 9/23/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation
@testable import MVVMFC_2

class MockupGitHubViewModel: GitHubViewModelType  {
    var requestClosure: ((Bool) -> Void)?
    
    var itemResults: [GitHubItem] = [
        // init GitHubItem here
    ]
    
    var ownerResults: [Owner] = [
        // init Owner here
    ]
    
    var urlStr: String!
    
    func getItem(key: String) {
        // set default here
    }
    
    func selected(url: String) {
        // set default here
    }
}
