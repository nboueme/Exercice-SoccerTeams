//
//  Route.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 25/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

struct Route<T> {
    let endpoint: String
}

struct Routes {
    static let allLeagues = Route<Leagues>(endpoint: "all_leagues.php")
    static func allTeams(in league: String) -> Route<Teams> {
        Route<Teams>(endpoint: "search_all_teams.php?l=\(queryable(parameter: league))")
    }
    static func allPlayers(in team: String) -> Route<Players> {
        Route<Players>(endpoint: "searchplayers.php?t=\(queryable(parameter: team))")
    }
}

// MARK: - Private functions
extension Routes {
    private static func queryable(parameter: String) -> String {
        parameter.replacingOccurrences(of: " ", with: "_")
    }
}
