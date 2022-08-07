//
//  HomeVM.swift
//  AvriocAssessment
//
//  Created by macbook on 06/08/2022.
//

import Foundation

class HomeVM: BaseVM {
    weak var appCoordinator : HomeCoordinator!
    var dataSource : NYTimesBaseModel?
    var homeService : HomeServiceable
    
    weak var delegate : HomeVCProtocol?
    init(homeService: HomeServiceable){
        self.homeService = homeService
        super.init()
    }
    
    override func fetchData() {
        homeService.getHomeList(for: 1) { [weak self] result in
            
            switch result {
            case .success(let articles):
                self?.dataSource = articles
                self?.delegate?.didGetList(errorMsg: nil)
            case .failure(let failure):
                self?.delegate?.didGetList(errorMsg: failure)
            }
        }
    }
    
    func goToDetailPage() {
        appCoordinator.goToHome()
    }
}
