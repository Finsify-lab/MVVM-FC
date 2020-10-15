//
//  MockupMainViewModel.swift
//  MVVMFC-2Tests
//
//  Created by Lê Hoàng Sinh on 9/23/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation
@testable import MVVMFC_2

class MockupMainViewModel: MainViewModelType {
    
    var items:[Menu] = []
    
    var itemsResult:[Menu] = [
        Menu(identifier: Identifier(rawValue: "gitHub")!,
             name: "gitHub",
             image: "square.and.arrow.up",
             url: "https://api.github.com/search/repositories?")
        // set item 2 3 4 .....
    ]
    
    var itemClosure: ((Bool) -> Void)?
    
    func selected(position: Int) {
        //set default value here
    }
    
    func checkInvalid(items: [Menu]) {
        //set default value here
    }
    
    func getData(fileName: String) {
        //set default value here
        let swapi = Dependency().swapi
        
        swapi.getDatas(fileName: fileName) {[weak self] (result) in
            switch result {
            case .success(let menus):
                self?.items = menus
            default:
                break
            }
        }
    }
    
}
