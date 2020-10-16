//
//  DetailViewModel.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

protocol DetailViewModelType {
    
    var imageClosure: ((Data)->Void)? {get set}
    
    
    
    var requestClosure : ((Bool) -> Void)? {get set}
    var itemResults: GitHubItem {get set}
    var ownerResults: Owner {get set}
    var count: Int { get set }
    
    
    func getItem()
    func getImage()
}



class DetailViewModel:DetailViewModelType {
    
    var flowController: DetailFlowController!
    var swapi: ResponseAPI!
    
    var imageClosure: ((Data)->Void)?
    
    var deepLinkUrl:String?
    var datasource: SubGitHubViewModelDatasource?
    
    var requestClosure : ((Bool) -> Void)?
    
    var count = 0
    var itemResults = GitHubItem()
    var ownerResults = Owner()
    
    init(flowController: DetailFlowController,swapi: ResponseAPI) {
        self.flowController = flowController
        self.swapi = swapi
    }

    func getItem() {
        
        guard let url = datasource?.updateSubView()  else {
            return
        }
        swapi.getGitHubOneItem(urlStr: url) {[weak self] (result) in
            switch result {
            case .success(let(items,owner)):
                self?.ownerResults = owner
                self?.itemResults = items
                guard let requestClosure = self?.requestClosure else { return }
                requestClosure(true)
                self?.count = 3
            case.failure(let err):
                print("err: \(err)")
            }
            
        }
    }
    
    func getImage() {
        let str = ownerResults.avatar_url
        guard let url = str else { return }
        swapi.getImage(urlStr: url) { [weak self] (data) in
            guard let imageClosure = self?.imageClosure else { return }
            imageClosure(data)
        }
    }
    
}
