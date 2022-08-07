//
//  AppDelegate.swift
//  AvriocAssessment
//
//  Created by macbook on 06/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator : HomeCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        let navigationCon = NavigationFactory.createHomeNavController()
        appCoordinator = HomeCoordinator(navController: navigationCon)
        appCoordinator!.start()
        window!.rootViewController = navigationCon
        window!.makeKeyAndVisible()
        return true
    }
}

