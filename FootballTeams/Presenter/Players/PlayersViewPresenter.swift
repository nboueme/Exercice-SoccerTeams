//
//  PlayersViewPresenter.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import Foundation

protocol PlayersViewDelegate: class {}

class PlayersViewPresenter {
    // MARK: - Properties
    private weak var delegate: PlayersViewDelegate?
    
    // MARK: - Constructor
    init() {}
    
    // MARK: - Delegate
    func setViewDelegate(_ delegate: PlayersViewDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: - Business Logic
}
