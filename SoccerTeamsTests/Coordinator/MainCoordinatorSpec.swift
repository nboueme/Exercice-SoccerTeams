//
//  MainCoordinatorSpec.swift
//  SoccerTeamsTests
//
//  Created by Nicolas Bouème on 26/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

@testable import Soccer_Teams

import Quick
import Nimble

class MainCoordinatorSpec: QuickSpec {
    override func spec() {
        var coordinator: MainCoordinator!
        
        beforeEach {
            coordinator = MainCoordinator()
        }
        
        describe("MainCoordinator") {
            it("start") {
                coordinator.start()
                
                let firstViewController = coordinator.navigationController.viewControllers.first
                expect(firstViewController).toNot(beNil())
                expect(firstViewController is HomeViewController).to(beTrue())
            }
            
            it("players") {
                coordinator.start()
                coordinator.players(for: FakeTeam.team1)
                
                RunLoop.current.run(until: Date())
                
                let viewControllers = coordinator.navigationController.viewControllers
                expect(viewControllers.count).to(equal(2))
                expect(coordinator.navigationController.topViewController is PlayersViewController).to(beTrue())
            }
        }
    }
}
