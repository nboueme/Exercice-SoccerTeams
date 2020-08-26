//
//  MainCoordinator.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    // MARK: - Properties
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let window: UIWindow
    
    // MARK: - Constructor
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds), navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        
        setupNavigationBar()
        setupWindow()
    }
    
    // MARK: - Navigation
    func start() {
        let viewController = HomeViewController.instantiate(storyboardName: StoryboardScene.Home.storyboardName)
        viewController.coordinator = self
        viewController.presenter = HomeViewPresenter(viewController, leagueRepository: WebLeagueRepository(), teamRepository: WebTeamRepository())
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func players(for team: Team) {
        let viewController = PlayersViewController.instantiate(storyboardName: StoryboardScene.Players.storyboardName)
        viewController.coordinator = self
        viewController.presenter = PlayersViewPresenter(viewController, playerRepository: WebPlayerRepository(), team: team)
        viewController.title = team.name
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - Private functions
extension MainCoordinator {
    private func setupNavigationBar() {
        navigationController.navigationBar.barTintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        navigationController.navigationBar.isTranslucent = false
    }
    
    private func setupWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
