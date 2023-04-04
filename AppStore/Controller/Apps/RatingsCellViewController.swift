//
//  RatingCellViewController.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import UIKit
private let reuseIndentifier = "RatingsDetailCell"
class RatingsCellViewController: UICollectionViewController {
     // MARK: - Properties
    var resultsEntry: [Entry] = []{
        didSet{ collectionView.reloadData() }
    }
     // MARK: - Lifecycle
     init() {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
         style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension RatingsCellViewController{
    private func style(){
        collectionView.register(RatingsDetailCell.self, forCellWithReuseIdentifier: reuseIndentifier)
    }
}
 // MARK: - UICollectionViewDataSource
extension RatingsCellViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.resultsEntry.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndentifier, for: indexPath) as! RatingsDetailCell
        cell.resultsEntry = self.resultsEntry[indexPath.row]
        return cell
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension RatingsCellViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height - 10)
    }
}
