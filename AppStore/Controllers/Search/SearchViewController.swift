//
//  SearchViewController.swift
//  AppStore
//
//  Created by ericzero on 12/26/22.
//

import UIKit
import SDWebImage

class SearchViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .systemGray
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: "SearchViewCell")
        fetchData()
        setUpSearchBar()
        activityIndicatorSet()
        title = "Search"
    }
    
    func activityIndicatorSet() {
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    // Timer for delaying search in searchbar
    var timer: Timer?
    
    // Data from Model
    var appResults = [Result]()
    
    func fetchData() {
        Service.shared.FetchData(searchTerm: "Twitter") { results, error in
            
            if let error = error {
                print("error appeared here:", error)
            }
            
            self.appResults = results
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // Search Controller
    
    let searchController = UISearchController(searchResultsController: nil)
    
    func setUpSearchBar() {
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = false
        searchController.searchBar.placeholder = "Games, Apps, Stories and More"
        searchController.searchBar.delegate = self
    }
  
    // MARK: Collection view Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 320)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchViewCell", for: indexPath) as! SearchViewCell
        
        cell.updateCell(data: appResults[indexPath.row])
        
        return cell
    }

}

// MARK: - SearchBar Delegate method

extension SearchViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            Service.shared.FetchData(searchTerm: searchText) { res, error in
                self.appResults = res
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }
        })
        
    }
}
