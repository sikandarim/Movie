//
//  extension+UIViewController.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-31.
//

import Foundation
import UIKit
extension UIViewController {

    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

