//
//  Item.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/15/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

struct Menu: Codable {
    var identifier:Identifier
    var name: String
    var image: String
    var url: String
}

enum Identifier: String,Codable {
    case gitHub = "gitHub"
    case song = "song"
    case new = "new"
    case invalid = "invalid"
}
