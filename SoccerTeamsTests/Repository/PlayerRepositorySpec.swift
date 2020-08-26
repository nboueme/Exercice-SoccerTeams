//
//  PlayerRepositorySpec.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

import Quick
import Nimble

class PlayerRepositorySpec: QuickSpec {
    override func spec() {
        var repository: PlayerRepository!
        var expectation: XCTestExpectation!
        
        beforeEach {
            repository = MockPlayerRepository()
            expectation = QuickSpec.current.expectation(description: "waiting for request")
        }
        
        describe("PlayerRepository") {
            it("findAll: remote") {
                var players = [Player]()
                
                repository.findAll(by: "Team 1") { result in
                    guard let fetchedPlayers = try? result.get() else { return }
                    players = fetchedPlayers
                    expectation.fulfill()
                }
                
                waitForExpectations()
                
                expect(players.count).toNot(equal(0))
                expect(players.count).to(equal(2))
            }
        }
        
        func waitForExpectations() {
            QuickSpec.current.waitForExpectations(timeout: 1)
        }
    }
}
