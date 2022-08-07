//
//  NYTimesReqError.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import Foundation

enum NYTimesReqError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .invalidURL:
            return "URL is not valid"
        case .noResponse:
            return "Unable to get response in given time"
        case .unexpectedStatusCode:
            return "Go unexpected status code"
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
