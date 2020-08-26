//
//  WebPlayerRepository.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

final class WebPlayerRepository: PlayerRepository {
    private let service = NetworkService()
    
    func findAll(by teamName: String, completion: @escaping PlayersCompletion) {
        service.fetch(fromRoute: Routes.allPlayers(in: teamName)) { result in
            switch result {
            case .success(let players):
                completion(.success(players.all))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
