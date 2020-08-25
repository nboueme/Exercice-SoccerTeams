//
//  NetworkService.swift
//  SoccerTeams
//
//  Created by Nicolas Bouème on 25/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import Foundation

typealias FetchDecodable<T: Decodable> = (Result<T, Error>) -> Void

final class NetworkService {
    private let baseURL = "https://www.thesportsdb.com/api/v1/json"
    private var apiKey = "1" // Public API Key
    private let session = URLSession.shared
    private var task: URLSessionTask?
    
    func fetch<T: Decodable> (fromRoute route: Route<T>, completion: @escaping FetchDecodable<T>) {
        cancelFetchRequest()
        
        guard let url = URL(string: getCompleteStringURL(baseURL, apiKey, route.endpoint)) else {
            completion(.failure(NSError(domain: "soccer-teams.com", code: 500)))
            return
        }
        
        let request = RequestFactory.request(method: .GET, url: url)
        
        task = session.dataTask(with: request) { data, response, error in
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
        
        task?.resume()
    }
}

// MARK: - Private functions
extension NetworkService {
    /**
     Cancel previous request if already in progress.
     */
    private func cancelFetchRequest() {
        if let task = task {
            task.cancel()
        }
        
        task = nil
    }
    
    /**
     - Parameter args: All the paths needed to make the complete String URL
     */
    private func getCompleteStringURL(_ args: String...) -> String {
        args.joined(separator: "/")
    }
}
