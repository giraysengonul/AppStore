//
//  AppModel.swift
//  AppStore
//
//  Created by hakkı can şengönül on 3.04.2023.
//

import Foundation
struct AppModel: Decodable {
    let feed: Feed
}
struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}
struct FeedResult: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
}
