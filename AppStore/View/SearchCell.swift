//
//  SearchCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 26.03.2023.
//

import UIKit
class SearchCell: UICollectionViewCell {
     // MARK: - Propeties
     // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension SearchCell{
    private func style(){
        backgroundColor = .green
    }
    private func layout(){
        
    }
}
