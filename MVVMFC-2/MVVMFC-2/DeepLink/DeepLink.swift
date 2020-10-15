//
//  DeepLink.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/17/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation


class DeepLink {
    static func handleDeepLink(str: String, url: URL, completion: ((String)->Void)) {
        if let urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true) {
            let path = urlComponent.path
            var urlStr = str
            urlStr = str + path
            if let queryItem = urlComponent.query {
                
                urlStr += "?" + queryItem
            }
            completion(urlStr)
        }else {
            completion("invalid")
            print("invalid user")
        }
    }
}
