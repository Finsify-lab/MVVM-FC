//
//  DetailViewModel.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/3/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

protocol SubGitHubViewModelDatasource: class {
    func updateSubView()->String?
}

protocol GitHubViewModelType:SubGitHubViewModelDatasource {
    
    var  requestClosure : ((Bool) -> Void)? { get set }
    var itemResults : [GitHubItem] {get set }
    var ownerResults : [Owner]{ get set}
    var datasource: SubMainViewModelDatasource? {get}
    var url:String? {set get}
    
    func getItem(key: String)
    func selected()
    
}

class GitHubViewModel: GitHubViewModelType {
        
    var flowController: GitHubFlowController!
    var swapi: ResponseAPI!
    
    weak var datasource: SubMainViewModelDatasource?
    var requestClosure : ((Bool) -> Void)?
    
    var itemResults = [GitHubItem]()
    var ownerResults = [Owner]()
    
    var url: String?
    
    init(flowController: GitHubFlowController,swapi: ResponseAPI) {
        self.flowController = flowController
        self.swapi = swapi
    }
    
    func getItem(key: String) {
        let urlDatasource = datasource?.updateSubView(identifier: .gitHub )
        let url = "\(urlDatasource ?? "")q=\(key)"
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
    
    func selected() {
        flowController.showDetail()
    }
    
    
}

extension GitHubViewModel: SubGitHubViewModelDatasource {
    func updateSubView() -> String? {
        return url
    }
    
    
}
