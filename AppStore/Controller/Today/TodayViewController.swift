//
//  TodayViewController.swift
//  AppStore
//
//  Created by hakkı can şengönül on 25.03.2023.
//

import UIKit
private let reuseIdentifier = "TodayCell"
class TodayViewController: UICollectionViewController {
     // MARK: - Properties
    private var startLocation: CGRect?
    private let todayDetailViewController = TodayDetailViewController()
     // MARK: - Lifecycle
     init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
         style()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}
 // MARK: - Helpers
extension TodayViewController{
    private func style(){
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
 // MARK: - UICollectionViewDataSource
extension TodayViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TodayCell
        return cell
    }
}
 // MARK: - Actions
extension TodayViewController{
    @objc private func handleTodayDetailViewController(_ sender: UITapGestureRecognizer){
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8) {
            self.todayDetailViewController.view.frame = self.startLocation ?? .zero
            self.tabBarController?.tabBar.alpha = 1
        } completion: { _ in
            self.todayDetailViewController.removeFromParent()
            self.todayDetailViewController.view.removeFromSuperview()
        }

    }
}
 // MARK: - UICollectionViewDelegate
extension TodayViewController{
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = collectionView.cellForItem(at: indexPath)
        self.startLocation = item?.superview?.convert(item?.frame ?? .zero, to: nil)
        todayDetailViewController.view.frame = startLocation ?? .zero
        self.todayDetailViewController.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTodayDetailViewController)))
        addChild(todayDetailViewController)
        view.addSubview(todayDetailViewController.view)
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8) {
            self.todayDetailViewController.view.frame = self.view.frame
            self.tabBarController?.tabBar.alpha = 0
        } completion: { _ in
            
        }

        
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension TodayViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width / 1.3, height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 30)
    }
}
