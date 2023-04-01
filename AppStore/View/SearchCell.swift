//
//  SearchCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 26.03.2023.
//

import UIKit
class SearchCell: UICollectionViewCell {
     // MARK: - Propeties
    var result: Result?{
        didSet{ configure() }
    }
    private let appPhoto: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemPurple
        imageView.layer.cornerRadius = 12
        imageView.widthAnchor.constraint(equalToConstant: 66).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 66).isActive = true
        return imageView
    }()
    private let screenImageView1: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemBrown
        return imageView
    }()
    private let screenImageView2: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemBrown
        return imageView
    }()
    private let screenImageView3: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemBrown
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
    private let ratingLabel: UILabel = {
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
        return button
    }()
    private var headerStackView: UIStackView!
    private var labelStackView: UIStackView!
    private var screenStackView: UIStackView!
    private var fullStackView: UIStackView!
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
            nameLabel,categoryLabel,ratingLabel
        ])
        labelStackView.distribution = .fillEqually
        labelStackView.axis = .vertical
        headerStackView = UIStackView(arrangedSubviews: [
            appPhoto,labelStackView,getButton
        ])
        headerStackView.spacing = 12
        headerStackView.axis = .horizontal
        headerStackView.alignment = .center
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        screenStackView = UIStackView(arrangedSubviews: [
            screenImageView1,screenImageView2,screenImageView3
        ])
        screenStackView.axis = .horizontal
        screenStackView.distribution = .fillEqually
        screenStackView.spacing = 8
        
        fullStackView = UIStackView(arrangedSubviews: [
            headerStackView,screenStackView
        ])
        fullStackView.axis = .vertical
        fullStackView.spacing = 8
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(fullStackView)
        NSLayoutConstraint.activate([
            fullStackView.topAnchor.constraint(equalTo: topAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            fullStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fullStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    private func configure(){
        guard let result = self.result else { return }
        self.nameLabel.text = result.trackName
        self.ratingLabel.text = String(format: "%.2f", result.averageUserRating ?? 0)
        self.categoryLabel.text = result.primaryGenreName
    }
}
