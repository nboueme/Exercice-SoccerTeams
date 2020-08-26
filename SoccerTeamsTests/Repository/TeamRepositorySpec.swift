//
//  TeamRepositorySpec.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

import Quick
import Nimble

class TeamRepositorySpec: QuickSpec {
    override func spec() {
        var repository: TeamRepository!
        var expectation: XCTestExpectation!
        
        beforeEach {
            repository = MockTeamRepository()
            expectation = QuickSpec.current.expectation(description: "waiting for request")
        }
        
        describe("TeamRepository") {
            it("findAll: remote") {
                var teams = [Team]()
                
                repository.findAll(by: "Ligue 1") { result in
                    guard let fetchedTeams = try? result.get() else { return }
                    teams = fetchedTeams
                    expectation.fulfill()
                }
                
                waitForExpectations()
                
                expect(teams.count).toNot(equal(0))
                expect(teams.count).to(equal(2))
            }
        }
        
        func waitForExpectations() {
            QuickSpec.current.waitForExpectations(timeout: 1)
        }
    }
}
