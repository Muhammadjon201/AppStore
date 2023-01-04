//
//  NetworkCall.swift
//  AppStore
//
//  Created by ericzero on 12/30/22.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int?
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String?
    let primaryGenreName: String?
    var averageUserRating: Float?
    let screenshotUrls: [String] // app screenshots
    let artworkUrl100: String? // app icon
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}
