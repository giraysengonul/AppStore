//
//  AppCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 2.04.2023.
//

import UIKit
class AppCell: UICollectionViewCell {
     // MARK: - Properties
    var feed:Feed?{
        didSet{ configure() }
    }
    private let sectionLabel: UILabel = {
       let label = UILabel()
        label.text = "Section Name"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    private let appCellDetailViewController = AppCellDetailViewController()
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
extension AppCell{
    private func style(){
        backgroundColor = .blue
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        appCellDetailViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(sectionLabel)
        addSubview(appCellDetailViewController.view)
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: topAnchor),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            appCellDetailViewController.view.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor),
            appCellDetailViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appCellDetailViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appCellDetailViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    private func configure(){
        guard let feed = self.feed else { return }
        self.sectionLabel.text = feed.title
        self.appCellDetailViewController.results = feed.results
    }
}
