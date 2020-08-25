//
//  HomeViewPresenter.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import Foundation

protocol HomeViewDelegate: class {}

class HomeViewPresenter {
    // MARK: - Properties
    private weak var delegate: HomeViewDelegate?
    let service: ApiService
    private(set) var soccerLeagues = [League]()
    private(set) var filteredLeagues = [League]()
    
    // MARK: - Constructor
    init(service: ApiService = ApiService()) {
        self.service = service
    }
    
    // MARK: - Delegate
    func setViewDelegate(_ delegate: HomeViewDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: - Business Logic
    func getSoccerLeagues() {
        service.fetchLeagues { [weak self] data in
            guard let leagues = try? data.get() else { return }
            self?.soccerLeagues = leagues.all.filter { $0.sport == League.Sport.soccer }
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
