//
//  AppInfoHeaderCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import UIKit
class AppInfoHeaderCell: UICollectionViewCell {
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
extension AppInfoHeaderCell{
    private func style(){
        backgroundColor = .red
    }
    private func layout(){
        
    }
}
