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
    var feedArray: [Feed] = []
    var appsHeaderResult: [AppHeaderModel] = []
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
        fetchDatailData()
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
 // MARK: - Service
extension AppsViewContoller{
    private func fetchDatailData(){
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        AppsService.fetchData(urlString: URL_TOPFREE ) { feed in
            dispatchGroup.leave()
            self.feedArray.append(feed)
        }
        dispatchGroup.enter()
        AppsService.fetchData(urlString: URL_TOPPAID) { feed in
            dispatchGroup.leave()
            self.feedArray.append(feed)
        }
        dispatchGroup.enter()
        AppsService.fetchHeaderData(urlString: URL_HEADER) { result in
            dispatchGroup.leave()
            self.appsHeaderResult = result
        }
        dispatchGroup.notify(queue: .main) {
            self.collectionView.reloadData()
        }
    }
}
 // MARK: - UICollectionViewDataSource
extension AppsViewContoller{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.feedArray.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppCell
        cell.feed = self.feedArray[indexPath.row]
        cell.delegate = self
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppsHeaderView
        header.appsHeaderResult = self.appsHeaderResult
        return header
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension AppsViewContoller: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 10, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 0, right: 0)
    }
}
 // MARK: - AppCellProtocol
extension AppsViewContoller: AppCellProtocol{
    func goAppInfoViewController(id: String) {
        let controller = AppInfoViewController()
        controller.appID = id
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
