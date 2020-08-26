//
//  MockTeamRepository.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

final class MockTeamRepository: TeamRepository {
    func findAll(by leagueName: String, completion: @escaping TeamsCompletion) {
        if leagueName == "Ligue 1" {
            completion(.success(FakeTeam.teamsLeague1))
        } else if leagueName == "Ligue 2" {
            completion(.success(FakeTeam.teamsLeague2))
        } else {
            completion(.success(FakeTeam.teamsLeagueN))
        }
    }
}
