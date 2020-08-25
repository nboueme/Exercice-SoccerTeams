//
//  Team.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 25/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

struct Team {
    let teamId: String
    let name: String
    let badgeURL: String
}

extension Team: Decodable {
    enum CodingKeys: String, CodingKey {
        case teamId = "idTeam"
        case name = "strTeam"
        case badgeURL = "strTeamBadge"
    }
}

struct Teams {
    let all: [Team]
}

extension Teams: Decodable {
    enum CodingKeys: String, CodingKey {
        case all = "teams"
    }
}
