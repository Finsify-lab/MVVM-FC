//
//  Service.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/15/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

class Service {
    
    //get data through file
    public static func request(urlStr:String, completion: @escaping (Data)->Void ){
        guard let safeUrl = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else
        { return
            
        }
        guard let url = URL(string: safeUrl) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            guard let data = data, err == nil else {
                return
            }
            completion(data)
        }.resume()
    }
    //get data through url
    public static func requestJson<T:Codable>(urlStr: String,completion: @escaping (Result<T,NetworkError>)->Void) {
        
        guard let url = URL(string: urlStr)  else {
            completion(.failure(.failedToGetData))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data, err == nil else {
                completion(.failure(.failedToGetData))
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            }catch {
                completion(.failure(.failedToGetData))
            }
        }.resume()
    }
}
