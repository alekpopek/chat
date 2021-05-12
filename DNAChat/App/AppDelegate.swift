//
//  AppDelegate.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        AppAppearance.configure()
        
        LocalDatabase().insertInitialDataIfNeeded()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController: UINavigationController = UINavigationController()
        let viewModel = ChatViewModel()
        let viewController = ChatViewController(
            viewModel: viewModel
        )
        navigationController.setViewControllers([viewController], animated: false)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
