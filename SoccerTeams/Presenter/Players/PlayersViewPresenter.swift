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
    private let service: ApiService
    
    // MARK: - Constructor
    init(_ delegate: PlayersViewDelegate, service: ApiService = ApiService()) {
        self.delegate = delegate
        self.service = service
    }
    
    // MARK: - Business Logic
}
