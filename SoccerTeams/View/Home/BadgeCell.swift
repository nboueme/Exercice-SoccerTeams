//
//  BadgeCell.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 25/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import UIKit
import Kingfisher

class BadgeCell: UICollectionViewCell {
    static let identifier = "BadgeCell"
    
    // MARK: - Properties
    @IBOutlet weak var teamBadge: UIImageView!
    
    var teamBadgeStringURL: String! {
        didSet {
            guard let teamBadgeURL = URL(string: teamBadgeStringURL) else { return }
            teamBadge.kf.setImage(with: teamBadgeURL)
        }
    }
}
