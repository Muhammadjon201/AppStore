//
//  GamesModel.swift
//  AppStore
//
//  Created by ericzero on 1/3/23.
//

import Foundation

struct AppResult: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id: String?
    let name: String?
    let artistName: String?
    let artworkUrl100: String?
}
