//
//  PlayerCell.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 25/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import UIKit
import Kingfisher

class PlayerCell: UITableViewCell {
    static let identifier = "PlayerCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSeparator()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var playerPhoto: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    @IBOutlet weak var transferAmount: UILabel!
    
    // MARK: - Properties
    var player: Player! {
        didSet {
            name.text = player.fullname
            position.text = player.position
            birthdate.text = L10n.Player.birthdate(player.birthdate)
            transferAmount.text = L10n.Player.price(player.transferAmount)
            
            if let link = player.photoCutout, let url = URL(string: link) {
                playerPhoto.kf.setImage(with: url)
            } else if let link = player.photoThumb, let url = URL(string: link) {
                playerPhoto.kf.setImage(with: url)
            }
        }
    }
}

// MARK: - Private functions
extension PlayerCell {
    private func setupSeparator() {
        let separatorLineHeight = CGFloat(10)
        let cellSize = frame.size
        let separatorFrame = CGRect(x: 0, y: cellSize.height - separatorLineHeight, width: cellSize.width, height: separatorLineHeight)
        let separatorView = UIView.init(frame: separatorFrame)
        separatorView.backgroundColor = .systemBackground
        
        addSubview(separatorView)
    }
}
