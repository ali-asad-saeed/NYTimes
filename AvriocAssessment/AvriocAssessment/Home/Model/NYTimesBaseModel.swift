//
//  DetailVM.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import Foundation
struct NYTimesBaseModel : Codable {
    internal init(status: String?, copyright: String?, num_results: Int?, results: [ArticlesResult]?) {
        self.status = status
        self.copyright = copyright
        self.num_results = num_results
        self.results = results
    }
    
	let status : String?
	let copyright : String?
	let num_results : Int?
	let results : [ArticlesResult]?

}
