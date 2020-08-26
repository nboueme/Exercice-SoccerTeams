//
//  WebTeamRepository.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

final class WebTeamRepository: TeamRepository {
    private let service = NetworkService()
    
    func findAll(by leagueName: String, completion: @escaping TeamsCompletion) {
        service.fetch(fromRoute: Routes.allTeams(in: leagueName)) { result in
            switch result {
            case .success(let teams):
                completion(.success(teams.all))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
