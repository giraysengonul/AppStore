//
//  AppCellDetailCell.swift
//  AppStore
//
//  Created by hakkı can şengönül on 2.04.2023.
//

import UIKit
import Kingfisher
protocol AppCellDetailCellProtocol: AnyObject {
    func goAppInfoViewController(id: String)
}
class AppCellDetailCell: UICollectionViewCell {
     // MARK: - Properties
    weak var delegate: AppCellDetailCellProtocol?
    var result: FeedResult?{
        didSet{ configure() }
    }
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
 // MARK: - Selectors
extension AppCellDetailCell{
    @objc private func handleSelf(){
        delegate?.goAppInfoViewController(id: result?.id ?? "")
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
        fullStackView.spacing = 8
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        getButton.layer.cornerRadius = 34 / 2
        appIcon.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSelf))
        self.addGestureRecognizer(tapGesture)
    }
    private func layout(){
        addSubview(fullStackView)
        NSLayoutConstraint.activate([
            appIcon.widthAnchor.constraint(equalToConstant: 80),
            appIcon.heightAnchor.constraint(equalToConstant: 65),
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 34),
            fullStackView.topAnchor.constraint(equalTo: topAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fullStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fullStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    private func configure(){
        guard let result = self.result else { return }
        let viewModel = AppCellDetailCellViewModel(result: result)
        self.nameLabel.text = viewModel.name
        self.firmLabel.text = viewModel.artistName
        self.appIcon.kf.setImage(with: viewModel.appImageUrl)
    }
}
