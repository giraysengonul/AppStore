//
//  SearchResult.swift
//  AppStore
//
//  Created by hakkı can şengönül on 1.04.2023.
//

import Foundation
struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}
struct Result: Decodable {
    let primaryGenreName: String
    let artworkUrl100: String
    let trackName: String
    let screenshotUrls: [String]
    var averageUserRating: Float?
}
