//
//  MainViewModel.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/3/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

protocol SubMainViewModelDatasource: class {
    func updateSubView(identifier: Identifier)->String?
}

protocol MainViewModelType: SubMainViewModelDatasource {
    
    
    var items: [Menu] { get set } // mảng chứa dữ liệu trả về
    var itemsResult: [Menu] { get set } // mảng chứa dữ liệu sau khi gọi hàm "checkInvalid()"
    var itemClosure: ((Bool)->Void)? { get set } //thông báo khi lấy dữ liệu thành công
    
    func selected(position: Int) // khi ấn vào 1 item
    func checkInvalid(items: [Menu]) // kiểm tra xem nếu identifier là "invalid" thì ẩn đi
    func getData(fileName: String) // lấy dữ liệu thông qua internet
}



class MainViewModel: MainViewModelType {
    
    var flowController : MainFlowController!
    var swapi: ResponseAPI!
    
    var items = [Menu]()
    var itemsResult = [Menu]()
    
    var itemClosure: ((Bool)->Void)?
    
    var datasource: SubMainViewModelDatasource?
    
    
    init(flowController: MainFlowController,swapi: ResponseAPI) {
        self.flowController = flowController
        self.swapi = swapi
    }
    
    func selected(position: Int) {
        let item = items[position]
        switch item.identifier {
        
        case .gitHub:
            
            flowController.showGitHub(datasouce: datasource)
            print(item.url)
        case .song:
            print(item.url)
            flowController.showSong(datasouce: datasource)
        case .invalid:
            break
        case .new:
            print(item.url)
            flowController.showError()
        }
        
    }
    
    func checkInvalid(items: [Menu]){
        for i in 0..<items.count {
            switch items[i].identifier {
            case .gitHub:
                itemsResult.append(items[i])
            case .song:
                itemsResult.append(items[i])
            case .invalid:
                break
            case .new:
                itemsResult.append(items[i])
            }
        }
    }
    
    
    func getData(fileName: String) {
        swapi.getDatas(fileName: fileName) {[weak self] (result) in
            switch result {
            case .success(let items):
                self?.checkInvalid(items: items)
                self?.items = items
                guard let itemClosure = self?.itemClosure else {
                    return
                }
                itemClosure(true)
            case .failure(let error):
                self?.flowController.showError()
                print("error: \(error)")
            }
        }
    }
    
        
}


extension MainViewModel:SubMainViewModelDatasource {
    
    func updateSubView(identifier: Identifier) -> String? {
        switch identifier {
        case .gitHub:
            return "https://api.github.com/search/repositories?"
        case .song:
            return "https://api.musixmatch.com/ws/1.1/matcher.track.get?format=json&callback=callback&q_track=bad%20liar&apikey=4956530bff785fed72839e6a88be226d"
        default:
            return nil
        }
    }
    
    
}
