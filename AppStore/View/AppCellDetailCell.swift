//
//  AppCellDetailCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 2.04.2023.
//

import UIKit
class AppCellDetailCell: UICollectionViewCell {
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
extension AppCellDetailCell{
    private func style(){
        backgroundColor = .cyan
    }
    private func layout(){
        
    }
}
