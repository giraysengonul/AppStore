//
//  TodayDetailCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 6.04.2023.
//

import UIKit
class TodayDetailCell: UITableViewCell {
     // MARK: - Properties
    var today: TodayDetailViewModel?{
        didSet{
            configure()
        }
    }
    private let headTitleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    private let subTitleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    private var labelStackView: UIStackView!
     // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension TodayDetailCell{
    private func setup(){
        labelStackView = UIStackView(arrangedSubviews: [headTitleLabel,subTitleLabel])
        labelStackView.axis = .vertical
        labelStackView.spacing = 4
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(labelStackView)
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    private func configure(){
        guard let todayViewModel = self.today else { return  }
        self.headTitleLabel.attributedText = todayViewModel.title1
        self.subTitleLabel.attributedText = todayViewModel.title2
    }
}
