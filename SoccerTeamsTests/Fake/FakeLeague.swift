//
//  FakeLeague.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

struct FakeLeague {
    static let league1 = League(leagueId: "1", name: "Ligue 1", alternateName: "Uber Eats 1", sport: .soccer)
    static let league2 = League(leagueId: "2", name: "Ligue 2", alternateName: nil, sport: .soccer)
    static let league3 = League(leagueId: "3", name: "Ligue 3", alternateName: "Uber Eats 3", sport: .soccer)
    
    static let leagues = [
        FakeLeague.league1,
        FakeLeague.league2,
        FakeLeague.league3
    ]
}
