//
//  DetailVM.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import Foundation
struct ArticlesResult : Codable {
	let uri : String?
	let url : String?
	let id : Int?
	let asset_id : Int?
	let source : String?
	let published_date : String?
	let updated : String?
	let section : String?
	let subsection : String?
	let nytdsection : String?
	let column : String?
	let byline : String?
	let type : String?
	let title : String?
	let abstract : String?
	let des_facet : [String]?
	let org_facet : [String]?
	let per_facet : [String]?
	let geo_facet : [String]?
	let media : [ArticleMedia]?
	let eta_id : Int?
}

extension ArticlesResult : NewsCellData {
    var _title: String {
        return self.title ?? "--"
    }
    
    var _subTitle: String {
        return self.abstract ?? "--"
    }
    
    var _author: String {
        return self.source ?? "--"
    }
    
    var _date: String {
        return self.published_date ?? "--"
    }
    
    
}
