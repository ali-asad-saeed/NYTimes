//
//  HomeService.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import Foundation


enum HomeEndpoint {
    case mostViewed(period: Int)
}

extension HomeEndpoint: NYTimesEndpoint {
    var path: String {
        switch self {
        case .mostViewed(let period):
            return "/svc/mostpopular/v2/viewed/\(period).json"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        let accessToken = "e4GtMKxeV5uNAJsl8myrEG7JhoufGHWO"
        let item = URLQueryItem(name: "api-key", value: accessToken)
         return [item]
    }

    var method: NYTimesReqMethod {
        switch self {
        case .mostViewed:
            return .get
        }
    }

    var header: [String: String]? {
        // Access Token to use in Bearer header
        
        switch self {
        case .mostViewed:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .mostViewed:
            
            return nil
        }
    }
}
