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
    override func spec() {
        beforeEach {
            LeagueStorage.save(leagues: FakeLeague.leagues)
        }
        
        describe("LeagueStorage") {
            it("findAll") {
                let leagues = LeagueStorage.findAll()
                expect(leagues.count).to(equal(3))
            }
            
            it("findBy: league.name") {
                let league = LeagueStorage.find(by: FakeLeague.league2.name)
                
                expect(league).toNot(beNil())
                expect(league!.alternateName).to(beNil())
            }
            
            it("findBy: league.alternateName") {
                let league = LeagueStorage.find(by: FakeLeague.league1.alternateName!)
                
                expect(league).toNot(beNil())
                expect(league!.name).to(equal(FakeLeague.league1.name))
            }
        }
    }
}
