//
//  HomeViewController.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    var presenter: HomeViewPresenter!
    
    // MARK: - Outlets
    @IBOutlet weak var badgesCollectionView: UICollectionView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getSoccerLeagues()
    }
}

// MARK: - Private functions
extension HomeViewController {}

// MARK: - Presenter Delegate
extension HomeViewController: HomeViewDelegate {
    func reloadDataSource() {
        DispatchQueue.main.async {
            self.badgesCollectionView.reloadData()
        }
    }
}

// MARK: - Search results updating Delegate
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        presenter.filterContentForSearchText(searchText)
        presenter.getTeams()
    }
}

// MARK: - Collection DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BadgeCell.identifier, for: indexPath as IndexPath) as! BadgeCell
        cell.teamBadgeStringURL = presenter.teams[indexPath.row].badgeURL
        return cell
    }
}

// MARK: - Collection Delegate Flow
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.players(for: presenter.teams[indexPath.row].name)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}
