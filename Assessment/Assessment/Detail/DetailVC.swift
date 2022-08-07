//
//  DetailVC.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import UIKit
import WebKit

class DetailVC: BaseVC {

    @IBOutlet weak var webView: WKWebView!
    var viewModel : DetailVM!
    var link: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let link = link , let url = URL(string: link) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    override func updateUI() {
        let back = BarButtonFactory.createBarButton(name: "back", owner: self)
        navigationItem.leftBarButtonItem = back
        
        if let leftBarButtonItem = navigationItem.leftBarButtonItem {
            leftBarButtonItem.target = self
            leftBarButtonItem.action = #selector(onBack)
        }
    }
    
    @objc
    func onBack() {
        viewModel.goBack()
    }
}
