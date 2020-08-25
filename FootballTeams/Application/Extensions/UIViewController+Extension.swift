//
//  UIViewController+Extension.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import UIKit

extension UIViewController {
    /**
     Use this method to get an instance of the UIViewController of your choice.
     You need to set a `Storyboard ID` with the same name of this UIViewController.
     
     - Parameter storyboardName: The name of your storyboard
     - Returns: The choosen UIViewController's Type.
     */
    static func instantiate(storyboardName: String) -> Self {
        let storyboardId = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: storyboardId) as! Self
    }
}
