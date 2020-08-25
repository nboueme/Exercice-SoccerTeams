//
//  PlayersViewController.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    var presenter: PlayersViewPresenter!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Private functions
extension PlayersViewController {}

// MARK: - Presenter Delegate
extension PlayersViewController: PlayersViewDelegate {}
