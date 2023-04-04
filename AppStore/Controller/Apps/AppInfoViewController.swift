//
//  AppInfoViewController.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import UIKit
private let reuseHeaderCellIdentifier = "HeaderCell"
class AppInfoViewController: UICollectionViewController {
     // MARK: - Properties
     // MARK: - Lifecycle
     init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
}
 // MARK: - Helpers
extension AppInfoViewController{
    private func style(){
        self.navigationItem.largeTitleDisplayMode = .never
        collectionView.register(AppInfoHeaderCell.self, forCellWithReuseIdentifier: reuseHeaderCellIdentifier)
    }
}
 // MARK: - UICollectionViewDataSource
extension AppInfoViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseHeaderCellIdentifier, for: indexPath) as! AppInfoHeaderCell
        return cell
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension AppInfoViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}
