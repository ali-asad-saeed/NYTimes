//
//  Alert.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
