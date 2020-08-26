//
//  FootballTeamsTests.swift
//  FootballTeamsTests
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import XCTest
@testable import Soccer_Teams

class SoccerTeamsTests: XCTestCase {
    var presenter: HomeViewPresenter!
    
    override func setUp() {
        super.setUp()
        presenter = HomeViewPresenter(self, leagueRepository: WebLeagueRepository(), teamRepository: WebTeamRepository())
    }
    
    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func test_leagues() {
        XCTAssertEqual(presenter.soccerLeagues.count, 0)
    }
}

extension SoccerTeamsTests: HomeViewDelegate {
    func setAutocompleteData(with leaguesName: [String]) {}
    
    func reloadDataSource() {}
}
