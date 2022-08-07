//
//  ViewController.swift
//  AvriocAssessment
//
//  Created by macbook on 06/08/2022.
//

import UIKit

class HomeVC: BaseVC {

    var viewModel : HomeVM!
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "NY Times Most Popular"
        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }

    override func updateUI() {
        
        self.view.backgroundColor = AppColor.viewBGColor
        
        let leftItem = BarButtonFactory.createBarButton(with: "line.3.horizontal", owner: nil)
        navigationItem.leftBarButtonItem = leftItem
        
        let right1 = BarButtonFactory.createBarButton(with: "magnifyingglass", owner: nil)
        let right2 = BarButtonFactory.createBarButton(with: "ellipsis", owner: nil)
        navigationItem.rightBarButtonItems = [right2,right1]
    }
    
    @objc
    func addTapped() {
        
    }
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
