//
//  DetailCellViewModel.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/9/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

class DetailCellViewModel {
    
    var dataClosure : ((GitHubItem,Owner)->Void)?
    var imageClosure: ((Data)->Void)?
    
    
    
    func getData(item: GitHubItem, owner: Owner) {
        guard let dataClosure = dataClosure else { return }
        dataClosure(item,owner)
    }
    
    func getImage(data: Data) {
        guard let imageClosure = imageClosure else { return }
        imageClosure(data)
    }
    
}
