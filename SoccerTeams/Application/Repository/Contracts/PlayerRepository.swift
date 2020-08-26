//
//  PlayerRepository.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

typealias PlayersCompletion = (Result<[Player], Error>) -> Void

protocol PlayerRepository {
    func findAll(by teamName: String, completion: @escaping PlayersCompletion)
}
