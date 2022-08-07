//
//  StoryBoard.swift
//  AvriocAssessment
//
//  Created by macbook on 06/08/2022.
//

import Foundation

enum Storyboard: String {
    case home
    
    var name: String {
        switch self {
        case .home:
            return "Main"
        }
    }
}
