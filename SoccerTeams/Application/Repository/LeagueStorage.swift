//
//  LeagueStorage.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

/**
 Store League objects with an in-memory array storage.
 
 We can imagine that we have instead a local persitent storage with Core Data or Realm.
 */
final class LeagueStorage {
    private static var leagues = [League]()
    
    private init() {}
    
    static func save(leagues: [League]) {
        LeagueStorage.leagues = leagues
    }
    
    static func findAll() -> [League] {
        leagues
    }
    
    static func find(by leagueName: String) -> League? {
        leagues.first { league in
            if let alternateName = league.alternateName {
                return alternateName.lowercased().contains(leagueName.lowercased()) || league.name.lowercased().contains(leagueName.lowercased())
            } else {
                return league.name.lowercased().contains(leagueName.lowercased())
            }
        }
    }
}
