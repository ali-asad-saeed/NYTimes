//
//  BarButtonFactory.swift
//  AvriocAssessment
//
//  Created by macbook on 07/08/2022.
//

import UIKit

final class BarButtonFactory {
    class func createBarButton(with imageName: String, owner: UIViewController?) -> UIBarButtonItem {
        
        let leftItem = UIBarButtonItem(image: UIImage(systemName: imageName), style: .plain, target: owner, action: nil)
        leftItem.tintColor = .white
        return leftItem
    }
}
