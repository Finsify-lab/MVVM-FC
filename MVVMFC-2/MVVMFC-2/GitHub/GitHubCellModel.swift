//
//  GitHubCellModel.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/16/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

class GitHubCellModel {
    var dataClosure : ((String,String,Int) -> Void)?
    
    func setData(name: String, fullName: String, star: Int) {

        guard let dataClosure = dataClosure else {
            return
        }
        dataClosure(name,fullName,star)
    }

}
