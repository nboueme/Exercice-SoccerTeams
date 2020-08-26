//
//  FakeTeam.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

struct FakeTeam {
    static let team1 = Team(teamId: "1", name: "Team 1", badgeURL: "")
    static let team2 = Team(teamId: "2", name: "Team 2", badgeURL: "")
    static let team4 = Team(teamId: "4", name: "Team 4", badgeURL: "")
    static let team5 = Team(teamId: "5", name: "Team 5", badgeURL: "")
    static let team7 = Team(teamId: "7", name: "Team 7", badgeURL: "")
    
    static let teamsLeague1 = [
        FakeTeam.team1,
        FakeTeam.team4
    ]
    
    static let teamsLeague2 = [
        FakeTeam.team2,
        FakeTeam.team4,
        FakeTeam.team5,
        FakeTeam.team7
    ]
    
    static let teamsLeagueN = [
        FakeTeam.team1,
        FakeTeam.team5,
        FakeTeam.team7
    ]
}
