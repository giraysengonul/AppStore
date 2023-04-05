//
//  TodayCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 5.04.2023.
//

import UIKit
class TodayCell: UICollectionViewCell {
     // MARK: - Properties
     // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension TodayCell{
    private func style(){
        backgroundColor = .white
        layer.cornerRadius = 14
    }
    private func layout(){
        
    }
}
