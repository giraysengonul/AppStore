//
//  AppInfoHeaderCellViewModel.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import Foundation
struct AppInfoHeaderCellViewModel {
    let result: Result
    init(result: Result) {
        self.result = result
    }
    var name: String?{
        return result.trackName
    }
    var releaseNotes: String?{
        return result.releaseNotes
    }
    var appImageUrl: URL?{
        return URL(string: result.artworkUrl100)
    }
    var formattedPrice: String?{
        return result.formattedPrice
    }
}
