//
//  AppsHeaderViewController.swift
//  AppStore
//
//  Created by hakkı can şengönül on 2.04.2023.
//

import UIKit
private let reuseIdentifier = "AppsHeaderViewCell"
class AppsHeaderViewController: UICollectionViewController {
     // MARK: - Properties
    var appsHeaderResult: [AppHeaderModel] = []{
        didSet{ collectionView.reloadData() }
    }
     // MARK: - Lifecycle
     init() {
         let flowLayout = UICollectionViewFlowLayout()
         flowLayout.scrollDirection = .horizontal
        super.init(collectionViewLayout: flowLayout)
         style()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension AppsHeaderViewController{
    private func style(){
        collectionView.register(AppsHeaderViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
   
}
 // MARK: - UICollectionViewDataSource
extension AppsHeaderViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appsHeaderResult.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppsHeaderViewCell
        cell.appHeaderModel = self.appsHeaderResult[indexPath.row]
        return cell
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension AppsHeaderViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 40, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 0, right: 0)
    }
}
