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
    private let service: NetworkService
    private let team: Team
    private(set) var players = [Player]() {
           didSet {
               delegate?.reloadDataSource()
           }
       }
    
    // MARK: - Constructor
    init(_ delegate: PlayersViewDelegate, service: NetworkService = NetworkService(), team: Team) {
        self.delegate = delegate
        self.service = service
        self.team = team
    }
    
    // MARK: - Business Logic
    func getPlayers() {
        service.fetch(fromRoute: Routes.allPlayers(in: team.name)) { [weak self] result in
            switch result {
            case .success(let players):
                self?.players = players.all
            case .failure(let error):
                print(error)
                
                // FAKE DATA YOU KNOW!
                self?.players = [
                    Player(playerId: "1", fullname: "Alpaga", position: "Pérou", birthdate: "1940-05-03", transferAmount: "$20,200,320", photoURL: "https://p0.pikist.com/photos/852/350/alpaca-farm-animal-livestock-wool-face-cute-funny-peru.jpg"),
                    Player(playerId: "2", fullname: "Lama", position: "Bolivie", birthdate: "1960-12-08", transferAmount: "$12,300,200", photoURL: "https://cdn.pixabay.com/photo/2017/11/02/12/05/lama-2910939_1280.jpg"),
                    Player(playerId: "3", fullname: "Shiba", position: "Harajuku", birthdate: "1980-04-02", transferAmount: "$19,500,006", photoURL: "https://upload.wikimedia.org/wikipedia/commons/5/58/Shiba_inu_taiki.jpg")
                ]
            }
        }
    }
}
