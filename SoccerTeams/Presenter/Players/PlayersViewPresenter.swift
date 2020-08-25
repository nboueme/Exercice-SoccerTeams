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
    private let service: ApiService
//    private(set) var players = [Player]() {
//           didSet {
//               delegate?.reloadDataSource()
//           }
//       }
    
    // MARK: - Constructor
    init(_ delegate: PlayersViewDelegate, service: ApiService = ApiService()) {
        self.delegate = delegate
        self.service = service
    }
    
    // MARK: - Business Logic
//    func getPlayers(in team: Team) {
//        service.fetchPlayers(for: team.name) { [weak self] data in
//            guard let players = try? data.get() else { return }
//            self?.players = players.all
//        }
//    }
}
