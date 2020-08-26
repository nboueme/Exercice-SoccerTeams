//
//  HomeViewPresenter.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import Foundation

protocol HomeViewDelegate: class {
    func setAutocompleteData(with leaguesName: [String])
    func reloadDataSource()
}

class HomeViewPresenter {
    // MARK: - Properties
    private weak var delegate: HomeViewDelegate?
    private let service: NetworkService
    private(set) var soccerLeagues = LeagueStorage.findAll() {
        didSet {
            let leaguesName = soccerLeagues.map { $0.name } + soccerLeagues.compactMap { $0.alternateName }
            delegate?.setAutocompleteData(with: leaguesName.sorted())
        }
    }
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
                let soccerLeagues = leagues.all.filter { $0.sport == League.Sport.soccer }
                LeagueStorage.save(leagues: soccerLeagues)
                self?.soccerLeagues = soccerLeagues
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getTeams(for leagueName: String) {
        guard let league = LeagueStorage.find(by: leagueName) else { return }
        
        service.fetch(fromRoute: Routes.allTeams(in: league.name)) { [weak self] result in
            switch result {
            case .success(let teams):
                self?.teams = teams.all
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func resetTeams() {
        teams = []
    }
}
