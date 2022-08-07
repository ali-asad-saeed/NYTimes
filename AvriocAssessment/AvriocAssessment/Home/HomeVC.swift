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

        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
    }

    override func updateUI() {
        
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
}
