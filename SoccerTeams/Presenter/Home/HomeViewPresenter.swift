//
//  HomeViewPresenter.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import Foundation

protocol HomeViewDelegate: class {
    func reloadDataSource()
}

class HomeViewPresenter {
    // MARK: - Properties
    private weak var delegate: HomeViewDelegate?
    private let service: NetworkService
    private(set) var soccerLeagues = [League]()
    private(set) var filteredLeagues = [League]()
    private(set) var teams = [Team]() {
        didSet {
            delegate?.reloadDataSource()
        }
    }
    
    // MARK: - Constructor
    init(_ delegate: HomeViewDelegate, service: NetworkService = NetworkService()) {
        self.delegate = delegate
        self.service = service
    }
    
    // MARK: - Business Logic
    func getSoccerLeagues() {
        service.fetch(fromRoute: Routes.allLeagues) { [weak self] result in
            switch result {
            case .success(let leagues):
                self?.soccerLeagues = leagues.all.filter { $0.sport == League.Sport.soccer }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getTeams() {
        guard let league = filteredLeagues.first else {
            teams = []
            return
        }
        
        service.fetch(fromRoute: Routes.allTeams(in: league.name)) { [weak self] result in
            switch result {
            case .success(let teams):
                self?.teams = teams.all
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredLeagues = soccerLeagues.filter { league in
            if let alternateName = league.alternateName {
                return league.name.lowercased().contains(searchText.lowercased())
                    ||
                    alternateName.lowercased().contains(searchText.lowercased())
            } else {
                return league.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
