//
//  MainTabBarController.swift
//  AppStore
//
//  Created by hakkı can şengönül on 25.03.2023.
//

import UIKit
class MainTabBarController: UITabBarController {
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
 // MARK: - Helpers
extension MainTabBarController{
    private func setup(){
        viewControllers = [
            createViewController(rootViewController: TodayViewController(), title: "Today", imageName: "doc.text.image"),
            createViewController(rootViewController: AppsViewContoller(), title: "Apps", imageName: "square.stack.3d.up"),
            createViewController(rootViewController: SearchViewController(), title: "Search", imageName: "magnifyingglass"),
         
        ]
    }
    private func createViewController(rootViewController: UIViewController, title: String, imageName: String) -> UIViewController{
        rootViewController.title = title
        let appearance = UINavigationBarAppearance()
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.compactAppearance = appearance
        controller.navigationBar.standardAppearance = appearance
        controller.navigationBar.scrollEdgeAppearance = appearance
        controller.navigationBar.compactScrollEdgeAppearance = appearance
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(systemName: imageName)
        return controller
    }
    
}
