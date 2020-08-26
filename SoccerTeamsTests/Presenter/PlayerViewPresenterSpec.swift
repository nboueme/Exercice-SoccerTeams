//
//  PlayerViewPresenter.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 27/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

import Quick
import Nimble

class PlayerViewPresenterSpec: QuickSpec {
    var presenter: PlayersViewPresenter!
    
    override func spec() {
        beforeEach {
            self.presenter = PlayersViewPresenter(self, playerRepository: MockPlayerRepository(), team: FakeTeam.team1)
        }
        
        describe("PlayersViewPresenter") {
            it("getPlayers") {
                self.presenter.getPlayers()
            }
        }
    }
}

extension PlayerViewPresenterSpec: PlayersViewDelegate {
    func reloadDataSource() {
        expect(self.presenter.players.count).to(equal(FakePlayer.playersTeam1.count))
    }
}
