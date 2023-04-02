//
//  AppCellDetailCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 2.04.2023.
//

import UIKit
class AppCellDetailCell: UICollectionViewCell {
     // MARK: - Properties
    private let appIcon: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemPurple
        return imageView
    }()
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "App Name"
        return label
    }()
    private let firmLabel: UILabel = {
       let label = UILabel()
        label.text = "Firm Label"
        return label
    }()
    private lazy var getButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.88, alpha: 1)
        return button
    }()
    var labelStackView: UIStackView!
    var fullStackView: UIStackView!
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
        labelStackView = UIStackView(arrangedSubviews: [nameLabel,firmLabel])
        labelStackView.axis = .vertical
        fullStackView = UIStackView(arrangedSubviews: [appIcon,labelStackView,getButton])
        fullStackView.axis = .horizontal
        fullStackView.alignment = .center
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        getButton.layer.cornerRadius = 34 / 2
        appIcon.layer.cornerRadius = 10
    }
    private func layout(){
        addSubview(fullStackView)
        NSLayoutConstraint.activate([
            appIcon.widthAnchor.constraint(equalToConstant: 80),
            appIcon.heightAnchor.constraint(equalToConstant: 80),
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 34),
            fullStackView.topAnchor.constraint(equalTo: topAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fullStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fullStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
