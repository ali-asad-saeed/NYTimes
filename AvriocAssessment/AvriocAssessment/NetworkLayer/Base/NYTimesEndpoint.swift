//
//  N.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import Foundation

protocol NYTimesEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: NYTimesReqMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension NYTimesEndpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.nytimes.com"
    }
}
