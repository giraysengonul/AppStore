//
//  AppCellDetailViewController.swift
//  AppStore
//
//  Created by hakkı can şengönül on 2.04.2023.
//

import UIKit
private let reuseIdentifier = "AppCellDetailCell"
protocol AppCellDetailViewControllerProtocol: AnyObject {
    func goAppInfoViewController(id: String)
}
class AppCellDetailViewController: UICollectionViewController {
     // MARK: - Properties
    weak var delegate: AppCellDetailViewControllerProtocol?
    var results: [FeedResult] = []{
        didSet{ collectionView.reloadData() }
    }
     // MARK: - Lifecycle
     init() {
         let flowLayout = UICollectionViewFlowLayout()
         flowLayout.scrollDirection = .horizontal
        super.init(collectionViewLayout: flowLayout)
         style()
         layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension AppCellDetailViewController{
    private func style(){
        collectionView.register(AppCellDetailCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    private func layout(){
        
    }
}
 // MARK: - UICollcetionViewDataSource
extension AppCellDetailViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.results.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppCellDetailCell
        cell.result = self.results[indexPath.row]
        cell.delegate = self
        return cell
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension AppCellDetailViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 30, height: (view.frame.height) / 3 - 3 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
   
}
 // MARK: - AppCellDetailCellProtocol
extension AppCellDetailViewController: AppCellDetailCellProtocol{
    func goAppInfoViewController(id: String) {
        delegate?.goAppInfoViewController(id: id)
    }

}
