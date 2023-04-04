//
//  ScreenshotDetailCellViewModel.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import Foundation
struct ScreenshotDetailCellViewModel {
    let result: String
    init(result: String) {
        self.result = result
    }
    var imageUrl: URL?{
        return URL(string: result)
    }
}
