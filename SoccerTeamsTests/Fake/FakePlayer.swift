//
//  FakePlayer.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

struct FakePlayer {
    static let player1 = Player(playerId: "1", fullname: "Name 1", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil)
    static let player2 = Player(playerId: "2", fullname: "Name 2", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil)
    static let player3 = Player(playerId: "3", fullname: "Name 3", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil)
    static let player4 = Player(playerId: "4", fullname: "Name 4", position: "", birthdate: "", transferAmount: "", photoCutout: nil, photoThumb: nil)
    
    static let playersTeam1 = [
        FakePlayer.player1,
        FakePlayer.player2
    ]
    
    static let playersTeam2 = [
        FakePlayer.player1,
        FakePlayer.player2,
        FakePlayer.player3,
        FakePlayer.player4
    ]
    
    static let playersTeamN = [
        FakePlayer.player2,
        FakePlayer.player3,
        FakePlayer.player4
    ]
}
