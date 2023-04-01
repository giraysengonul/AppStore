//
//  Extension.swift
//  AppStore
//
//  Created by hakkı can şengönül on 26.03.2023.
//

import UIKit
extension UIImageView{
    func customMode(){
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
    func customScreenshot(){
        layer.cornerRadius = 12
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 0.85
    }
}
