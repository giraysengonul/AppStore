//
//  RatingsCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import UIKit
class RatingsCell: UICollectionViewCell {
     // MARK: - Properties
    var resultsEntry: [Entry] = []{
        didSet{ ratingsCellViewController.resultsEntry = resultsEntry }
    }
    private let ratingLabel: UILabel = {
       let label = UILabel()
        label.text = "Ratings"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    private let ratingsCellViewController = RatingsCellViewController()
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
extension RatingsCell{
    private func style(){
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingsCellViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(ratingLabel)
        addSubview(ratingsCellViewController.view)
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: topAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            ratingsCellViewController.view.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor),
            ratingsCellViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            ratingsCellViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ratingsCellViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
