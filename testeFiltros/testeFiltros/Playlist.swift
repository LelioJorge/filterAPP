//
//  Album.swift
//  testeFiltros
//
//  Created by Lelio Jorge Junior on 31/07/19.
//  Copyright © 2019 Lelio Jorge Junior. All rights reserved.
//

import Foundation

struct User: Decodable {
    var id: Int
    var name: String
    var picture_medium: String
}

struct UserData: Decodable {
    var data: [User]
}

struct Playlist: Decodable {
    var id: Int
    var title: String
    var tracks: Tracks
    var creator: Creator
}

struct Creator: Decodable {
    var id: Int
    var playlist: [Playlist]
}


struct Tracks: Decodable {
    var data: [trackData]
}

struct trackData: Decodable {
    var id: Int
    var title: String
    var artist: Artist
    var album: Album
    var type: String
}

struct Artist: Decodable {
    var id: Int
    var name: String
    var type: String
}

struct Album: Decodable {
    var id: Int
    var title: String
    var type: String
}
