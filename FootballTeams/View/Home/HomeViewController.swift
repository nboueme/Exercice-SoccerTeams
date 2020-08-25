//
//  HomeViewController.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var badgesCollectionView: UICollectionView!
    
    weak var coordinator: MainCoordinator?
    var presenter: HomeViewPresenter!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getSoccerLeagues()
    }
}

// MARK: - Private functions
extension HomeViewController {}

// MARK: - Search results updating Delegate
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        presenter.filterContentForSearchText(searchText)
        badgesCollectionView.reloadData()
    }
}

// MARK: - Collection DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.filteredLeagues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BadgeCell.identifier, for: indexPath as IndexPath) as! BadgeCell
        return cell
    }
}

// MARK: - Collection Delegate Flow
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(presenter.filteredLeagues[indexPath.row].name)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}
