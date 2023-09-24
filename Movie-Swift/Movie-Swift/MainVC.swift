//
//  MainVC.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-31.
//

import Foundation
import UIKit

class MainVC: UITabBarController {
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
        setUpNavigationBar()
}
  
    private func setUpNavigationBar(){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = ThemeColor.bg
           UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .white
        tabBar.barTintColor = ThemeColor.bg
    }
    
    private func setupViews() {
        let mainNavigationVC = MainViewController()
        let settingVC = SettingVC()
       
        mainNavigationVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Movie List")
        settingVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Setting")
     

        let mainNC = UINavigationController(rootViewController: mainNavigationVC)
        let settingNC = UINavigationController(rootViewController: settingVC)
        
       let tabBarList = [mainNC, settingNC]
      
        viewControllers = tabBarList
    }

 
}

class SettingVC: UIViewController {
    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = false
        view.backgroundColor = ThemeColor.bg
    }
}



