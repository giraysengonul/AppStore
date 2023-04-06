//
//  RatingsDetailCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import UIKit
class RatingsDetailCell: UICollectionViewCell {
     // MARK: - Properties
    var resultsEntry: Entry?{
        didSet{ configure() }
    }
    private let titleLabel:UILabel = {
       let label = UILabel()
        label.text = "Title Label"
        return label
    }()
    private let userLabel:UILabel = {
       let label = UILabel()
        label.text = "User Label"
        return label
    }()
    private let starLabel:UILabel = {
       let label = UILabel()
        label.text = "Star Label"
        return label
    }()
    private let bodyLabel:UILabel = {
       let label = UILabel()
        label.text = "Body Label"
        label.numberOfLines = 0
        return label
    }()
    private var verticalStackView: UIStackView!
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
extension RatingsDetailCell{
    private func style(){
        backgroundColor = .systemGroupedBackground
        verticalStackView = UIStackView(arrangedSubviews: [
        UIStackView(arrangedSubviews: [titleLabel,userLabel]),
        starLabel,
        bodyLabel,
        UIView()
        ])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(verticalStackView)
        self.titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    private func configure(){
        guard let result = self.resultsEntry else { return }
        let viewModel = RatingsDetailCellViewModel(result: result)
        self.userLabel.text = viewModel.userText
        self.titleLabel.text = viewModel.titleText
        self.bodyLabel.text = viewModel.bodyText
        self.starLabel.text = viewModel.ratingText
    }
}
