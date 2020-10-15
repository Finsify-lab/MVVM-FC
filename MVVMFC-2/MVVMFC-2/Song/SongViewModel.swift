//
//  SongViewModel.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/14/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

protocol SongViewModelType {
    
    var url:String! { get set }
    
    var closureRequest : ((Track)->Void)?  { get set }
    
    var trackResult: Track!  { get set }
    
    func getSongData()
}

class SongViewModel: SongViewModelType {
    var flowController: SongViewFlowController!
    var swapi: ResponseAPI!
    
    var url:String!
    
    var closureRequest : ((Track)->Void)?
    
    var trackResult: Track!
    
    init(flowController: SongViewFlowController,swapi: ResponseAPI) {
        self.flowController = flowController
        self.swapi = swapi
    }
    
    func getSongData() {
        swapi.getSongData(urlStr: url) {[weak self] (result) in
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
