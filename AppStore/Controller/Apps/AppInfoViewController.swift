//
//  AppInfoViewController.swift
//  AppStore
//
//  Created by hakkı can şengönül on 4.04.2023.
//

import UIKit
private let reuseHeaderCellIdentifier = "HeaderCell"
private let reuseScreenshotCellIdentifier = "ScreenshotCell"
class AppInfoViewController: UICollectionViewController {
     // MARK: - Properties
    var results: [Result] = []{
        didSet{ collectionView.reloadData() }
    }
    var appID: String?{
        didSet{
            guard let id = self.appID else { return }
            fetchData(id: id)
        }
    }
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
 // MARK: - Service
extension AppInfoViewController{
    private func fetchData(id: String){
        SearchService.fetchDataID(id: id) { results in
            self.results = results
        }
    }
}
 // MARK: - Helpers
extension AppInfoViewController{
    private func style(){
        self.navigationItem.largeTitleDisplayMode = .never
        collectionView.register(AppInfoHeaderCell.self, forCellWithReuseIdentifier: reuseHeaderCellIdentifier)
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: reuseScreenshotCellIdentifier)
    }
}
 // MARK: - UICollectionViewDataSource
extension AppInfoViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseHeaderCellIdentifier, for: indexPath) as! AppInfoHeaderCell
            cell.result = self.results.first
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseScreenshotCellIdentifier, for: indexPath) as! ScreenshotCell
            return cell
        }
        
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension AppInfoViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0{
            let cell = AppInfoHeaderCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 250))
            cell.result = self.results.first
            cell.layoutIfNeeded()
            let estimatedCell = cell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            return .init(width: view.frame.width - 10, height: estimatedCell.height)
        }else{
            return .init(width: view.frame.width, height: 500)
        }
      
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 10)
    }
}
