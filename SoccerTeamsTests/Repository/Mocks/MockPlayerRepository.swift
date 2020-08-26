//
//  MockPlayerRepository.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

final class MockPlayerRepository: PlayerRepository {
    let playersTeam1 = [
        Player(playerId: "1", fullname: "Name 1", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil),
        Player(playerId: "2", fullname: "Name 2", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil)
    ]
    
    let playersTeam2 = [
        Player(playerId: "1", fullname: "Name 1", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil),
        Player(playerId: "2", fullname: "Name 2", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil),
        Player(playerId: "3", fullname: "Name 3", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil),
        Player(playerId: "4", fullname: "Name 4", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil)
    ]
    
    let playersTeamN = [
        Player(playerId: "2", fullname: "Name 2", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil),
        Player(playerId: "3", fullname: "Name 3", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil),
        Player(playerId: "4", fullname: "Name 4", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil)
    ]
    
    func findAll(by teamName: String, completion: @escaping PlayersCompletion) {
        if teamName == "Team 1" {
            completion(.success(playersTeam1))
        } else if teamName == "Team 2" {
            completion(.success(playersTeam2))
        } else {
            completion(.success(playersTeamN))
        }
    }
}
