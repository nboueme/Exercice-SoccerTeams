//
//  MockTeamRepository.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

final class MockTeamRepository: TeamRepository {
    let teamsLeague1 = [
        Team(teamId: "2", name: "Team 2", badgeURL: ""),
        Team(teamId: "3", name: "Team 3", badgeURL: "")
    ]
    
    let teamsLeague2 = [
        Team(teamId: "2", name: "Team 2", badgeURL: ""),
        Team(teamId: "3", name: "Team 3", badgeURL: ""),
        Team(teamId: "4", name: "Team 4", badgeURL: "")
    ]
    
    let teamsLeagueN = [
        Team(teamId: "1", name: "Team 1", badgeURL: ""),
        Team(teamId: "5", name: "Team 5", badgeURL: ""),
        Team(teamId: "6", name: "Team 6", badgeURL: ""),
        Team(teamId: "8", name: "Team 8", badgeURL: "")
    ]
    
    func findAll(by leagueName: String, completion: @escaping TeamsCompletion) {
        if leagueName == "Ligue 1" {
            completion(.success(teamsLeague1))
        } else if leagueName == "Ligue 2" {
            completion(.success(teamsLeague2))
        } else {
            completion(.success(teamsLeagueN))
        }
    }
}
