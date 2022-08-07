//
//  NavigationFactory.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import UIKit


class BaseNav: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

final class NavigationFactory {
    
    class func createHomeNavController() -> UINavigationController {
        
        let navigationController = BaseNav()
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = AppColor.navBarColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.standardAppearance = navBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        return navigationController
    }
}
