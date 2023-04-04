//
//  ScreenShotCellViewController.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import UIKit
private let reuseIdentifier = "ScreenshotDetailCell"
class ScreenShotCellViewController: UICollectionViewController {
     // MARK: - Ptoprties
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
extension ScreenShotCellViewController{
    private func style(){
        collectionView.register(ScreenshotDetailCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
 // MARK: - UICollectionViewDataSource
extension ScreenShotCellViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ScreenshotDetailCell
        return cell
    }
}
extension ScreenShotCellViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width / 1.5, height: view.frame.height )
    }
}
