//
//  HomeViewController.swift
//  FootballTeams
//
//  Created by Nicolas Bouème on 24/08/2020.
//  Copyright © 2020 Nicolas Bouème. All rights reserved.
//

import UIKit
import ModernSearchBar

class HomeViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    var presenter: HomeViewPresenter!
    var modernSearchBar: ModernSearchBar!
    
    // MARK: - Outlets
    @IBOutlet weak var badgesCollectionView: UICollectionView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        presenter.getSoccerLeagues()
    }
}

// MARK: - Private functions
extension HomeViewController {
    private func setupSearchBar() {
        modernSearchBar = ModernSearchBar()
        modernSearchBar.delegateModernSearchBar = self
        modernSearchBar.placeholder = L10n.Home.SearchBar.placeholder
        navigationItem.titleView = modernSearchBar
    }
}

// MARK: - Presenter Delegate
extension HomeViewController: HomeViewDelegate {
    func setAutocompleteData(with leaguesName: [String]) {
        modernSearchBar.setDatas(datas: leaguesName)
    }
    
    func reloadDataSource() {
        DispatchQueue.main.async {
            self.badgesCollectionView.reloadData()
        }
    }
}
// MARK: - ModernSearchBarDelegate
extension HomeViewController: ModernSearchBarDelegate {
    func onClickItemSuggestionsView(item: String) {
        modernSearchBar.text = item
        presenter.getTeams(for: item)
        modernSearchBar.getSuggestionsView().isHidden = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.resetTeams()
        modernSearchBar.getSuggestionsView().isHidden = false
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
        coordinator?.players(for: presenter.teams[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = CGFloat(60) // Section Insets left and right + spacing for cells
        let itemSize = (collectionView.frame.width - spacing) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}
