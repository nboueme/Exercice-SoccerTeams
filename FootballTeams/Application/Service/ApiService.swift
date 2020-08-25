//
//  ApiService.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import Foundation

typealias LeaguesCompletion = (Result<Leagues, Error>) -> Void

final class ApiService {
    private let session = URLSession.shared
    private var baseURL = "https://www.thesportsdb.com/api/v1/json"
    private var apiKey = "1"
    
    enum Path: String {
        case allLeagues = "all_leagues.php"
    }
    
    func fetchLeagues(completion: @escaping LeaguesCompletion) {
        let completeURL = getCompleteURL(baseURL, apiKey, Path.allLeagues.rawValue)
        fetchRequest(with: completeURL, mapTo: Leagues.self, completion)
    }
}

extension ApiService {
    typealias FetchDecodable<T: Decodable> = (Result<T, Error>) -> Void
    
    private func getCompleteURL(_ args: String...) -> URL {
        let url = URL(string: args.joined(separator: "/"))
        return url!
    }
    
    private func fetchRequest<T: Decodable>(with url: URL, mapTo decodable: T.Type, _ completion: @escaping FetchDecodable<T>) {
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}
