//
//  AppCellDetailCellViewModel.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import Foundation
struct AppCellDetailCellViewModel {
    let result: FeedResult
    init(result: FeedResult) {
        self.result = result
    }
    var appImageUrl: URL?{
        return URL(string: result.artworkUrl100)
    }
    var artistName: String?{
        return result.artistName
    }
    var name: String?{
        return result.name
    }
}
