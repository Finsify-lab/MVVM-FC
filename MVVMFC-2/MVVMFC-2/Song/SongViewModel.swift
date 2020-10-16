//
//  SongViewModel.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/14/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

protocol SongViewModelType {
    
    
    
    var closureRequest : ((Track)->Void)?  { get set }
    
    var trackResult: Track!  { get set }
    
    var datasource: SubMainViewModelDatasource? {get}
    
    func getSongData()
}

class SongViewModel: SongViewModelType {
    var flowController: SongViewFlowController!
    var swapi: ResponseAPI!
    
    var datasource: SubMainViewModelDatasource?
    
    var closureRequest : ((Track)->Void)?
    
    var trackResult: Track!
    
    init(flowController: SongViewFlowController,swapi: ResponseAPI) {
        self.flowController = flowController
        self.swapi = swapi
    }
    
    func getSongData() {
        guard let urlDatasource = datasource?.updateSubView(identifier: .song ) else {
            return
        }
        swapi.getSongData(urlStr: urlDatasource) {[weak self] (result) in
            switch result {
            case .success(let track):
                self?.trackResult = track
                guard let closureRequest = self?.closureRequest else {
                    return
                }
                closureRequest(track)
            case .failure(let err):
                print("err: \(err)")
            }
        }
    }
}
