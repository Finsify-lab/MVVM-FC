//
//  DeepLink.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/16/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

protocol DeepLinkProtocol {
    func handleDeepLinkType(url: URL, completion:((String)->Void))
}

enum DeepLinkType:DeepLinkProtocol {
    case github
    case song
    
    func handleDeepLinkType(url: URL, completion:((String) -> Void)) {
        switch self {
        case .github:
            let urlString = "https://api.github.com"
            DeepLink.handleDeepLink(str: urlString, url: url) { (result) in
                completion(result)
            }
        case .song:
            let urlString = "https://api.musixmatch.com"
            DeepLink.handleDeepLink(str: urlString, url: url) { (result) in
                completion(result)
            }
        }
    }

}

