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

enum UrlStr: String,Codable {
    case gitHub = "https://api.github.com/search/repositories?"
    case song = "https://api.musixmatch.com/ws/1.1/matcher.track.get?format=json&callback=callback&q_track=bad%20liar&apikey=4956530bff785fed72839e6a88be226d"
}

enum Identifier: String,Codable {
    case gitHub = "gitHub"
    case song = "song"
    case new = "new"
    case invalid = "invalid"
}
