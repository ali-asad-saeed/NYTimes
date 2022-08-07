//
//  NewsCell.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import UIKit

protocol NewsCellData {
    var _title: String {get}
    var _subTitle: String {get}
    var _author: String {get}
    var _date: String {get}
}

class NewsCell: UITableViewCell {

    @IBOutlet weak var imgContainerView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    var data: NewsCellData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgContainerView.layer.cornerRadius = 20
        
        updateUI()
    }
    
    func updateUI () {
        
        if let data = data {
            self.lblTitle.text = data._title
            self.lblSubTitle.text = data._subTitle
            self.lblAuthor.text = data._author
            self.lblDate.text = data._date
        }
    }
    
}
