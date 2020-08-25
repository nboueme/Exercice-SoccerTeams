//
//  PlayersViewController.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    var presenter: PlayersViewPresenter!
    
    // MARK: - Outlets
    @IBOutlet weak var playersTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private functions
extension PlayersViewController {
    private func setupUI() {
        playersTableView.separatorStyle = .none
        playersTableView.tableFooterView = UIView()
    }
}

// MARK: - Presenter Delegate
extension PlayersViewController: PlayersViewDelegate {
    func reloadDataSource() {
        playersTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension PlayersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerCell.identifier, for: indexPath as IndexPath) as! PlayerCell
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PlayersViewController: UITableViewDelegate {}
