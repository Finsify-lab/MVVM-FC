//
//  MockupDetailViewModel.swift
//  MVVMFC-2Tests
//
//  Created by Lê Hoàng Sinh on 9/23/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation
@testable import MVVMFC_2

class MockupDetailViewModel: DetailViewModelType {
    
    var imageClosure: ((Data) -> Void)?
    
    var url: String! = "" //set request url here
    
    var requestClosure: ((Bool) -> Void)?
    
    var itemResults: GitHubItem = GitHubItem() // set GitHubItem value here
    
    var ownerResults: Owner = Owner() // set Owner value here
    
    var count: Int = 0
    
    func getItem() {
        //set default func here
    }
    
    func getImage() {
        //set default func here
    }
    
    
}
