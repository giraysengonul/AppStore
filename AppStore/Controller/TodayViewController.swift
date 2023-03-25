//
//  TodayViewController.swift
//  AppStore
//
//  Created by hakkı can şengönül on 25.03.2023.
//

import UIKit

class TodayViewController: UIViewController {
     // MARK: - Properties
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
 // MARK: - Helpers
extension TodayViewController{
    private func style(){
        view.backgroundColor = .yellow
    }
    private func layout(){
        
    }
}
