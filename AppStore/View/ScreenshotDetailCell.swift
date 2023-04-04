//
//  ScreenshotDetailCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import UIKit
class ScreenshotDetailCell: UICollectionViewCell {
     // MARK: - Properties
    private let screenshotImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .red
        return imageView
    }()
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
extension ScreenshotDetailCell{
    private func style(){
        screenshotImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(screenshotImageView)
        NSLayoutConstraint.activate([
            screenshotImageView.topAnchor.constraint(equalTo: topAnchor),
            screenshotImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            screenshotImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            screenshotImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
