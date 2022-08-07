//
//  AppCoordinator.swift
//  AvriocAssessment
//
//  Created by macbook on 06/08/2022.
//

import Foundation
import UIKit



class HomeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    let storyboard = UIStoryboard.init(name: Storyboard.home.name, bundle: .main)
    
    init(navController : UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        goToHome()
    }
    
    func goToHome(){
        // Instantiate HomeVC
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        // Instantiate HomeViewModel
        let homeViewModel = HomeVM.init()
        // Set the Coordinator to the ViewModel
        homeViewModel.appCoordinator = self
        // Set the ViewModel to ViewController
        homeVC.viewModel = homeViewModel
        // Push it.
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func goToDetail(withLink: String?){
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        let detailVM = DetailVM.init()
        detailVM.appCoordinator = self
        detailVC.viewModel = detailVM
        detailVC.link = withLink
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    func popController() {
        navigationController.popViewController(animated: true)
    }
}
