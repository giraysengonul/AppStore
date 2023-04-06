//
//  TodayCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 5.04.2023.
//

import UIKit
class TodayCell: UICollectionViewCell {
     // MARK: - Properties
    private let detailImageView: UIImageView = {
        let imageView =  UIImageView()
        imageView.customMode()
        imageView.image = UIImage(named: "game")
        imageView.layer.cornerRadius = 14
        return imageView
    }()
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Title"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
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
extension TodayCell{
    private func style(){
        backgroundColor = .white
        layer.cornerRadius = 14
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(detailImageView)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: topAnchor),
            detailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
