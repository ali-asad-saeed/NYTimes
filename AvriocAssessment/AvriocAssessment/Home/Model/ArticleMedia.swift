//
//  DetailVM.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import Foundation
struct ArticleMedia : Codable {
	let type : String?
	let subtype : String?
	let caption : String?
	let copyright : String?
	let approved_for_syndication : Int?
	let articleMediaMetaData : [ArticleMediaMetadata]?
}
