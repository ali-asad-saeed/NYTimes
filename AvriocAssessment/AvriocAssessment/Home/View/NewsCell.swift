//
//  NewsCell.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var imgContainerView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var btnDate: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgContainerView.layer.cornerRadius = 20
        
    }
    
}
