//
//  MockPlayerRepository.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

final class MockPlayerRepository: PlayerRepository {
    func findAll(by teamName: String, completion: @escaping PlayersCompletion) {
        if teamName == "Team 1" {
            completion(.success(FakePlayer.playersTeam1))
        } else if teamName == "Team 2" {
            completion(.success(FakePlayer.playersTeam2))
        } else {
            completion(.success(FakePlayer.playersTeamN))
        }
    }
}
