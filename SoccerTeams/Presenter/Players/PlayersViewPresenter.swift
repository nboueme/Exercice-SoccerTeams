//
//  PlayersViewPresenter.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import Foundation

protocol PlayersViewDelegate: class {
    func reloadDataSource()
}

class PlayersViewPresenter {
    // MARK: - Properties
    private weak var delegate: PlayersViewDelegate?
    private let playerRepository: PlayerRepository
    private let team: Team
    private(set) var players = [Player]() {
           didSet {
               delegate?.reloadDataSource()
           }
       }
    
    // MARK: - Constructor
    init(_ delegate: PlayersViewDelegate?, playerRepository: PlayerRepository, team: Team) {
        self.delegate = delegate
        self.playerRepository = playerRepository
        self.team = team
    }
    
    // MARK: - Business Logic
    func getPlayers() {
        playerRepository.findAll(by: team.name) { [weak self] result in
            switch result {
            case .success(let players):
                self?.players = players
            case .failure(let error):
                print(error)
            }
        }
    }
}
