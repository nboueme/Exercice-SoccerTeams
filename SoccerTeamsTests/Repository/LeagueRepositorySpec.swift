//
//  FootballTeamsTests.swift
//  FootballTeamsTests
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

import Quick
import Nimble

class LeagueRepositorySpec: QuickSpec {
    override func spec() {
        var repository: LeagueRepository!
        var expectation: XCTestExpectation!
        
        beforeEach {
            repository = MockLeagueRepository()
            expectation = QuickSpec.current.expectation(description: "waiting for request")
        }
        
        describe("LeagueRepository") {
            it("findAll: remote") {
                var leagues = [League]()
                
                repository.findAll { result in
                    guard let fetchedLeagues = try? result.get() else { return }
                    leagues = fetchedLeagues
                    expectation.fulfill()
                }
                
                waitForExpectations()
                
                expect(leagues.count).toNot(equal(0))
                expect(leagues.count).to(equal(3))
            }
            
            it("findAll: local") {
                repository.findAll { result in
                    guard let fetchedLeagues = try? result.get() else { return }
                    repository.saveToLocalStorage(leagues: fetchedLeagues)
                    expectation.fulfill()
                }
                
                waitForExpectations()
                
                let leagues = repository.findAllInLocalStorage()
                expect(leagues.count).toNot(equal(0))
                expect(leagues.count).to(equal(3))
            }
            
            it("findOne: local") {
                repository.findAll { result in
                    guard let fetchedLeagues = try? result.get() else { return }
                    repository.saveToLocalStorage(leagues: fetchedLeagues)
                    expectation.fulfill()
                }
                
                waitForExpectations()
                
                let league = repository.findInLocalStorage(by: "Uber Eats 3")
                expect(league).toNot(beNil())
                expect(league!.name).to(equal("Ligue 3"))
            }
        }
        
        func waitForExpectations() {
            QuickSpec.current.waitForExpectations(timeout: 1)
        }
    }
}
