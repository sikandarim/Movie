//
//  AppDelegate.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    let onboardingViewController = OnboardingContainerViewController()
    let mainView = MainViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = ThemeColor.bg
        onboardingViewController.delegate = self
        displayScreen()
        
        return true
    }


}


extension AppDelegate {
    //Setup the uiview controller to root
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
    
    private func displayScreen() {
        if LocalState.hasOnboarded {
            setRootViewController(MainVC())
        } else {
            setRootViewController(onboardingViewController)
        }
    }

}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(MainVC())
    }
}


