//
//  Player.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 25/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

struct Player {
    let playerId: String
    let fullname: String
    let position: String
    let birthdate: String
    let transferAmount: String
    let photoCutout: String?
    let photoThumb: String?
}

extension Player: Decodable {
    enum CodingKeys: String, CodingKey {
        case playerId = "idPlayer"
        case fullname = "strPlayer"
        case position = "strPosition"
        case birthdate = "dateBorn"
        case transferAmount = "strSigning"
        case photoCutout = "strCutout"
        case photoThumb = "strThumb"
    }
}

struct Players {
    let all: [Player]
}

extension Players: Decodable {
    enum CodingKeys: String, CodingKey {
        case all = "player"
    }
}
