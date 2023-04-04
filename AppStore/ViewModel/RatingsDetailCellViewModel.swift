//
//  RatingsDetailCellViewModel.swift
//  AppStore
//
//  Created by hakkı can şengönül on 5.04.2023.
//

import Foundation
struct RatingsDetailCellViewModel {
    let result: Entry
    init(result: Entry) {
        self.result = result
    }
    var userText: String?{
        return result.author.name.label
    }
    var titleText: String?{
        return result.title.label
    }
    var bodyText: String?{
        return result.content.label
    }
    var ratingText: String?{
        var resultText = ""
        let count = Int(result.rating.label) ?? 0
        for _ in 0...count{
            resultText.append("⭐️")
        }
        return resultText
    }
}
