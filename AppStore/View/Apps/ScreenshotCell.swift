//
//  ScreenshotCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import UIKit
class ScreenshotCell: UICollectionViewCell {
     // MARK: - Properties
    var resultsImage: [String] = []{
        didSet{ screenshotCellViewController.resultsImage = resultsImage }
    }
    private let previewLabel: UILabel = {
       let label = UILabel()
        label.text = "Preview"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    private let screenshotCellViewController = ScreenShotCellViewController()
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
extension ScreenshotCell{
    private func style(){
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        screenshotCellViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(previewLabel)
        addSubview(screenshotCellViewController.view)
        NSLayoutConstraint.activate([
            previewLabel.topAnchor.constraint(equalTo: topAnchor),
            previewLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            previewLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            screenshotCellViewController.view.topAnchor.constraint(equalTo: previewLabel.bottomAnchor),
            screenshotCellViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            screenshotCellViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            screenshotCellViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
