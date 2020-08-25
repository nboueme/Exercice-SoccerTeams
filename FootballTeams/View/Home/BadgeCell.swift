//
//  BadgeCell.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 25/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import UIKit

class BadgeCell: UICollectionViewCell {
    static let identifier = "BadgeCell"
    
    // MARK: - Properties
    @IBOutlet weak var teamBadge: UIImageView!
    
    var teamBadgeStringURL: String? {
        didSet {
            guard let badgeStringURL = teamBadgeStringURL else { return }
            guard let coverURL = URL(string: badgeStringURL) else { return }
            guard let data = try? Data.init(contentsOf: coverURL) else { return }
            
            teamBadge.image = UIImage(data: data)
        }
    }
}
