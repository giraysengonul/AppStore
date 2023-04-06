//
//  TodayDetailViewModel.swift
//  AppStore
//
//  Created by hakkı can şengönül on 6.04.2023.
//

import UIKit

struct TodayDetailViewModel {
    let today: Today
    init(today: Today) {
        self.today = today
    }
    var title1: NSMutableAttributedString?{
        return attributedTitle(title1: today.detailTitle1, title2: today.title1)
    }
    var title2: NSMutableAttributedString?{
        return attributedTitle(title1: today.detailTitle2, title2: today.title2)
    }
    
    private func attributedTitle(title1: String, title2: String) -> NSMutableAttributedString{
        let attributedString = NSMutableAttributedString(string: title1, attributes: [.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 20)])
        attributedString.append(NSAttributedString(string: title2, attributes: [.foregroundColor: UIColor.darkGray, .font: UIFont.systemFont(ofSize: 18)]))
        return attributedString
    }
}
