//
//  DetailViewModel.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/3/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

protocol GitHubViewModelType {
    
    var  requestClosure : ((Bool) -> Void)? { get set }
    var itemResults : [GitHubItem] {get set }
    var ownerResults : [Owner]{ get set}
    var urlStr: String! { get set }
    
    func getItem(key: String)
    func selected(url: String)
    
}

class GitHubViewModel: GitHubViewModelType {
        
    var flowController: GitHubFlowController!
    var swapi: ResponseAPI!
    
    var urlStr: String!
    var requestClosure : ((Bool) -> Void)?
    
    var itemResults = [GitHubItem]()
    var ownerResults = [Owner]()
    
    
    init(flowController: GitHubFlowController,swapi: ResponseAPI) {
        self.flowController = flowController
        self.swapi = swapi
    }
    
    func getItem(key: String) {
        
        let url = "\(urlStr ?? "")q=\(key)"
    swapi.getGitHubItem(urlStr: url) {[weak self] (result) in
            switch result {
            case .success(let items):
                for i in items {
                    guard let owner = i.owner else {
                        return
                    }
                    self?.ownerResults.append(owner)
                }
                self?.itemResults = items
                guard let requestClosure = self?.requestClosure else { return }
                requestClosure(true)
            case.failure(let err):
                print("err: \(err)")
            }
        
        }
    }
    
    func selected(url: String) {
        flowController.showDetail(url: url)
    }
    
    
}
