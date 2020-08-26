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
    private let leagueRepository: LeagueRepository
    private let teamRepository: TeamRepository
    private(set) var soccerLeagues = [League]() {
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
    init(_ delegate: HomeViewDelegate?, leagueRepository: LeagueRepository, teamRepository: TeamRepository) {
        self.delegate = delegate
        self.leagueRepository = leagueRepository
        self.teamRepository = teamRepository
    }
    
    // MARK: - Business Logic
    func getSoccerLeagues() {
        let localLeagues = leagueRepository.findAllInLocalStorage()
        guard localLeagues.count == 0 else {
            soccerLeagues = localLeagues
            return
        }
        
        leagueRepository.findAll { [weak self] result in
            switch result {
            case .success(let leagues):
                self?.leagueRepository.saveToLocalStorage(leagues: leagues)
                self?.soccerLeagues = leagues
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getTeams(for leagueName: String) {
        guard let league = leagueRepository.findInLocalStorage(by: leagueName) else { return }
        
        teamRepository.findAll(by: league.name) { [weak self] result in
            switch result {
            case .success(let teams):
                self?.teams = teams
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func resetTeams() {
        teams = []
    }
}
