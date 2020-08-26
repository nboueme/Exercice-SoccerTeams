//
//  LeagueRepository.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

typealias LeaguesCompletion = (Result<[League], Error>) -> Void

protocol LeagueRepository {
    func findAll(completion: @escaping LeaguesCompletion)
    func saveToLocalStorage(leagues: [League])
    func findAllInLocalStorage() -> [League]
    func findInLocalStorage(by leagueName: String) -> League?
}
