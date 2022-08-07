//
//  ViewController.swift
//  AvriocAssessment
//
//  Created by macbook on 06/08/2022.
//

import UIKit

protocol HomeVCProtocol : NSObjectProtocol {
    func didGetList(errorMsg: NYTimesReqError?)
}

class HomeVC: BaseVC {

    var viewModel : HomeVM!
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        self.title = "NY Times Most Popular"
        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }

    override func updateUI() {
        
        self.view.backgroundColor = AppColor.viewBGColor
        
        let leftItem = BarButtonFactory.createBarButton(name: "menu", owner: nil)
        navigationItem.leftBarButtonItems = [leftItem]
        
        let right1 = BarButtonFactory.createBarButton(name: "magnifier", owner: nil)
        let right2 = BarButtonFactory.createBarButton(name: "rightMenu", owner: nil)
        navigationItem.rightBarButtonItems = [right2,right1]
    }
}

extension HomeVC : HomeVCProtocol {
    func didGetList(errorMsg: NYTimesReqError?) {
        if let errorMsg = errorMsg {
            self.showAlert(title: "Alert!", msg: errorMsg.customMessage)
        }else{
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }
}
extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        cell.data = viewModel.dataSource?.results?[indexPath.row]
        cell.updateUI()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = viewModel.dataSource?.results?[indexPath.row].url
        viewModel.appCoordinator.goToDetail(withLink: link)
    }
}
