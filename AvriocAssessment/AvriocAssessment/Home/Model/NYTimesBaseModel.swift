//
//  DetailVM.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import Foundation
struct NYTimesBaseModel : Codable {
	let status : String?
	let copyright : String?
	let num_results : Int?
	let results : [ArticlesResult]?

}
