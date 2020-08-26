//
//  LeagueStorageSpec.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

import Quick
import Nimble

class LeagueStorageSpec: QuickSpec {
    let leagues = [
        League(leagueId: "1", name: "Ligue 1", alternateName: "Uber Eats 1", sport: .soccer),
        League(leagueId: "2", name: "Ligue 2", alternateName: nil, sport: .soccer),
        League(leagueId: "3", name: "Ligue 3", alternateName: "Uber Eats 3", sport: .soccer)
    ]
    
    override func spec() {
        beforeEach {
            LeagueStorage.save(leagues: self.leagues)
        }
        
        describe("LeagueStorage") {
            it("findAll") {
                let leagues = LeagueStorage.findAll()
                expect(leagues.count).to(equal(3))
            }
            
            it("findBy: league.name") {
                let league = LeagueStorage.find(by: "Ligue 2")
                
                expect(league).toNot(beNil())
                expect(league!.alternateName).to(beNil())
            }
            
            it("findBy: league.alternateName") {
                let league = LeagueStorage.find(by: "Uber Eats 1")
                
                expect(league).toNot(beNil())
                expect(league!.name).to(equal("Ligue 1"))
            }
        }
    }
}
