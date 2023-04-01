//
//  SearchCellViewModel.swift
//  AppStore
//
//  Created by hakkı can şengönül on 1.04.2023.
//

import Foundation
struct SearchCellViewModel {
    let result: Result
    init(result: Result) {
        self.result = result
    }
    var ratingLabel: String?{
        return String(format: "%.2f", result.averageUserRating ?? 0)
    }
    var nameLabel:String?{
        return result.trackName
    }
    var categoryLabel: String?{
        return result.primaryGenreName
    }
    var appImage: URL?{
        return URL(string: result.artworkUrl100)
    }
    var screenshot1: URL?{
        return URL(string: result.screenshotUrls[0])
    }
    var screenshot2: URL?{
        return URL(string: result.screenshotUrls[1])
    }
    var screenshot3: URL?{
        return URL(string: result.screenshotUrls[2])
    }
}
