//
//  StoryBoard.swift
//  AvriocAssessment
//
//  Created by macbook on 06/08/2022.
//

import Foundation

enum Storyboard: String {
    case main
    
    var name: String {
        switch self {
        case .main:
            return "Main"
        }
    }
}
