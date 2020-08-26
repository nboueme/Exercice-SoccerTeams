//
//  MockLeagueRepository.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

final class MockLeagueRepository: LeagueRepository {
    private var leagues = [League]()
    
    func findAll(completion: @escaping LeaguesCompletion) {
        let leagues = [
            League(leagueId: "1", name: "Ligue 1", alternateName: "Uber Eats 1", sport: .soccer),
            League(leagueId: "2", name: "Ligue 2", alternateName: nil, sport: .soccer),
            League(leagueId: "3", name: "Ligue 3", alternateName: "Uber Eats 3", sport: .soccer)
        ]
        completion(.success(leagues))
    }
    
    func saveToLocalStorage(leagues: [League]) {
        self.leagues = leagues
    }
    
    func findAllInLocalStorage() -> [League] {
        leagues
    }
    
    func findInLocalStorage(by leagueName: String) -> League? {
        leagues.first { league in
            if let alternateName = league.alternateName {
                return alternateName.lowercased() == leagueName.lowercased() || league.name.lowercased() == leagueName.lowercased()
            } else {
                return league.name.lowercased() == leagueName.lowercased()
            }
        }
    }
}
