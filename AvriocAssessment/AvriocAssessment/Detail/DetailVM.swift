//
//  DetailVM.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import Foundation

class DetailVM {
    weak var appCoordinator : HomeCoordinator!
    
    func goBackHome() {
        appCoordinator.goToHome()
    }
}
