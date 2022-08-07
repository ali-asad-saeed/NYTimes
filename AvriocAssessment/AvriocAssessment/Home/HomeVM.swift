//
//  HomeVM.swift
//  AvriocAssessment
//
//  Created by macbook on 06/08/2022.
//

import Foundation

class HomeVM {
    weak var appCoordinator : HomeCoordinator!
    
    func goToDetailPage() {
        appCoordinator.goToHome()
    }
}
