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
    private let service: ApiService
    private(set) var soccerLeagues = [League]()
    private(set) var filteredLeagues = [League]()
    private(set) var teams = [Team]() {
        didSet {
            delegate?.reloadDataSource()
        }
    }
    
    // MARK: - Constructor
    init(_ delegate: HomeViewDelegate, service: ApiService = ApiService()) {
        self.delegate = delegate
        self.service = service
    }
    
    // MARK: - Business Logic
    func getSoccerLeagues() {
        service.fetchLeagues { [weak self] data in
            guard let leagues = try? data.get() else { return }
            self?.soccerLeagues = leagues.all.filter { $0.sport == League.Sport.soccer }
        }
    }
    
    func getTeams() {
        guard let league = filteredLeagues.first else {
            teams = []
            return
        }
        
        service.fetchTeams(for: league.name) { [weak self] data in
            guard let teams = try? data.get() else { return }
            self?.teams = teams.all
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
