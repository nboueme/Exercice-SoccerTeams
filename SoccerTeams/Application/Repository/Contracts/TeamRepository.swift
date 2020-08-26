//
//  TeamRepository.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

typealias TeamsCompletion = (Result<[Team], Error>) -> Void

protocol TeamRepository {
    func findAll(by leagueName: String, completion: @escaping TeamsCompletion)
}
