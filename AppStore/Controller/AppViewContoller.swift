//
//  AppViewContoller.swift
//  AppStore
//
//  Created by hakkı can şengönül on 25.03.2023.
//
import UIKit

class AppViewContoller: UIViewController {
     // MARK: - Properties
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
 // MARK: - Helpers
extension AppViewContoller{
    private func style(){
        view.backgroundColor = .green
    }
    private func layout(){
        
    }
}
