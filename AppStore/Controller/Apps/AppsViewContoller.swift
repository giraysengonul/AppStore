//
//  AppViewContoller.swift
//  AppStore
//
//  Created by hakkı can şengönül on 25.03.2023.
//
import UIKit
private let reuseIdentifier = "AppCell"
private let reuseHeaderIdentifier = "AppsHeaderCell"
class AppsViewContoller: UICollectionViewController {
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
        layout()
    }
}
 // MARK: - Helpers
extension AppsViewContoller{
    private func style(){
        view.backgroundColor = .green
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(AppsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifier)
    }
    private func layout(){
        
    }
}
 // MARK: - UICollectionViewDataSource
extension AppsViewContoller{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppCell
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath)
        return header
    }
}

extension AppsViewContoller: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}
