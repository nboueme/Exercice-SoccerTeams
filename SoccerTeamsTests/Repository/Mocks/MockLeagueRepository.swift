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
        completion(.success(FakeLeague.leagues))
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
