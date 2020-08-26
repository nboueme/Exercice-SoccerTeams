//
//  HomeViewPresenterSpec.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 27/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

import Quick
import Nimble

class HomeViewPresenterSpec: QuickSpec {
    var presenter: HomeViewPresenter!
    
    override func spec() {
        beforeEach {
            self.presenter = HomeViewPresenter(self, leagueRepository: MockLeagueRepository(), teamRepository: MockTeamRepository())
        }
        
        describe("HomeViewPresenter") {
            it("getSoccerLeagues") {
                self.presenter.getSoccerLeagues()
            }
            
            it("getTeams") {
                self.presenter.getSoccerLeagues()
                self.presenter.getTeams(for: FakeLeague.league1.name)
            }
        }
    }
}

extension HomeViewPresenterSpec: HomeViewDelegate {
    func setAutocompleteData(with leaguesName: [String]) {
        expect(leaguesName.count).to(equal(5))
    }
    
    func reloadDataSource() {
        expect(self.presenter.teams.count).to(equal(FakeTeam.teamsLeague1.count))
    }
}
