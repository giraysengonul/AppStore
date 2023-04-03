//
//  AppsHeaderViewModel.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import Foundation
struct AppsHeaderViewModel {
    let result: AppHeaderModel
    init(result: AppHeaderModel) {
        self.result = result
    }
    var imageUrl: URL?{
        return URL(string: result.imageUrl)
    }
    var title: String?{
        return result.title
    }
    var id: String?{
        return result.id
    }
    var name: String?{
        return result.name
    }
}
