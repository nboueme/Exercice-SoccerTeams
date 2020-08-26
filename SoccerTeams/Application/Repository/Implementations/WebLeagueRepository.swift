//
//  WebLeagueRepository.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import Foundation

final class WebLeagueRepository: LeagueRepository {
    private let service = NetworkService()
    
    func findAll(completion: @escaping LeaguesCompletion) {
        service.fetch(fromRoute: Routes.allLeagues) { result in
            switch result {
            case .success(let leagues):
                let soccerLeagues = leagues.all.filter { $0.sport == League.Sport.soccer }
                completion(.success(soccerLeagues))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func saveToLocalStorage(leagues: [League]) {
        LeagueStorage.save(leagues: leagues)
    }
    
    func findAllInLocalStorage() -> [League] {
        LeagueStorage.findAll()
    }
    
    func findInLocalStorage(by leagueName: String) -> League? {
        LeagueStorage.find(by: leagueName)
    }
}
