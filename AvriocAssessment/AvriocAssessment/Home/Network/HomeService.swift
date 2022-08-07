//
//  HomeService.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import Foundation


protocol HomeServiceable {
    
    func getHomeList(for period: Int, completionHandler: @escaping (Result<NYTimesBaseModel, NYTimesReqError>)->())
}

struct HomeService: NYTimesClient, HomeServiceable {
    
    func getHomeList(for period: Int, completionHandler: @escaping (Result<NYTimesBaseModel, NYTimesReqError>)->()) {
        sendRequest(endpoint: HomeEndpoint.mostViewed(period: period), responseModel: NYTimesBaseModel.self, completionHandler: completionHandler)
    }
}
