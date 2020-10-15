//
//  MainCellModel.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/15/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

class MainCellModel {
    
    var closureData : ((String,String,String)->Void)?
    
    func getData(name:String, img: String, url: String) {
        guard let closureData = closureData else { return }
        closureData(name,img,url)
    }
    
    
    
    
}
