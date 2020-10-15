//
//  File.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/15/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

enum NetworkError: String,Error {
    case failedToGetData
    case failedToGetMenuAPI
    case failedToGetGitHubAPI
    case failedToGetSongAPI
    case failedToGetImageAPI
}
