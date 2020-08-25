//
//  League.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

struct League {
    enum Sport: String {
        case soccer = "Soccer"
        case motorsport = "Motorsport"
        case motorsports = "Motorsports"
        case fighting = "Fighting"
        case baseball = "Baseball"
        case basketball = "Basketball"
        case americanFootball = "American Football"
        case iceHockey = "Ice Hockey"
        case golf = "Golf"
        case rugby = "Rugby"
        case tennis = "Tennis"
        case cricket = "Cricket"
        case cycling = "Cycling"
        case australianFootball = "Australian Football"
        case eSports = "ESports"
        case esports = "Esports"
        case volleyball = "Volleyball"
        case netball = "Netball"
        case handball = "Handball"
        case snooker = "Snooker"
        case fieldHockey = "Field Hockey"
        case darts = "Darts"
    }
    
    let leagueId: String
    let name: String
    let alternateName: String?
    let sport: Sport
}

extension League: Decodable {
    enum CodingKeys: String, CodingKey {
        case leagueId = "idLeague"
        case name = "strLeague"
        case alternateName = "strLeagueAlternate"
        case sport = "strSport"
    }
}

extension League.Sport: Decodable {}

struct Leagues {
    let all: [League]
}

extension Leagues: Decodable {
    enum CodingKeys: String, CodingKey {
        case all = "leagues"
    }
}
