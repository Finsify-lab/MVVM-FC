//
//  ResponseAPI.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/15/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation


class ResponseAPI {
    // get data from json file
    public func getDatas(fileName: String,completion: @escaping (Result<[Menu],NetworkError>)->Void) {
        
        if let url = Bundle.main.url(forResource: "\(fileName)", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let result = try decoder.decode(ResponseMenuData.self, from: data)
                let items = result.menu
                completion(.success(items))
                
            } catch {
                completion(.failure(.failedToGetMenuAPI))
            }
        }
    }
    // get data from api.github
    public func getGitHubItem(urlStr: String, completion: @escaping ((Result<[GitHubItem],NetworkError>)->Void)) {
        Service.requestJson(urlStr: urlStr) { (result: Result<ResponseGitHubData,NetworkError>) in
            switch result {
            case .success(let result):
                let item = result.items
                completion(.success(item))
            case .failure(_):
                completion(.failure(.failedToGetGitHubAPI))
            }
        }
    }
    public func getGitHubOneItem(urlStr: String, completion: @escaping ((Result<(GitHubItem,Owner),NetworkError>)->Void)) {
        Service.requestJson(urlStr: urlStr) { (result: Result<GitHubItem,NetworkError>) in
            switch result {
            case .success(let item):
                guard let owner = item.owner else {
                    completion(.failure(.failedToGetGitHubAPI))
                    return
                }
                completion(.success((item,owner)))
            case .failure(_):
                completion(.failure(.failedToGetGitHubAPI))
            }
        }
    }
    
    public func getImage(urlStr:String,completion: @escaping ((Data)->Void)){
        Service.request(urlStr: urlStr) { (data) in
            completion(data)
        }
        
    }
    
    public func getSongData(urlStr: String, completion: @escaping ((Result<Track,NetworkError>)->Void)) {
        
        Service.requestJson(urlStr: urlStr) { (result: (Result<ResponseSongData,NetworkError>)) in
            switch result {
            case .failure(_):
                completion(.failure(.failedToGetSongAPI))
            case .success(let result):
                let item = result.message.body.track
                completion(.success(item))
            }
        }
    }
}









