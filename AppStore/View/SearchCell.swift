//
//  SearchCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 26.03.2023.
//

import UIKit
class SearchCell: UICollectionViewCell {
     // MARK: - Propeties
    private let appPhoto: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemPurple
        imageView.layer.cornerRadius = 12
        imageView.widthAnchor.constraint(equalToConstant: 66).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        return imageView
    }()
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Twitter"
        return label
    }()
    private let categoryLabel: UILabel = {
       let label = UILabel()
        label.text = "Haberler"
        return label
    }()
    private let downloadLabel: UILabel = {
       let label = UILabel()
        label.text = "1.9M"
        return label
    }()
    private lazy var getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.90, alpha: 1)
        button.layer.cornerRadius = 12
        button.widthAnchor.constraint(equalToConstant: 53).isActive = true
        button.heightAnchor.constraint(equalToConstant: 33).isActive = true
        return button
    }()
    private var headerStackView: UIStackView!
    private var labelStackView: UIStackView!
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
        labelStackView = UIStackView(arrangedSubviews: [
            nameLabel,categoryLabel,downloadLabel
        ])
        labelStackView.spacing = 12
        labelStackView.distribution = .fillEqually
        labelStackView.axis = .vertical
        headerStackView = UIStackView(arrangedSubviews: [
            appPhoto,labelStackView,getButton
        ])
        headerStackView.spacing = 12
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(headerStackView)
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
}
