//
//  AppsViewController.swift
//  AppStore
//
//  Created by ericzero on 12/26/22.
//

import UIKit
import SnapKit

class AppsViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .systemGray
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()

    let headerId = "headerId"
    var appSearch: AppResult?
    var groups = [AppResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Apps"
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(AppsCollectionCell.self, forCellWithReuseIdentifier: "AppsCollectionCell")
        
        collectionView.register(AppsHorizontalHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView.showsVerticalScrollIndicator = false
        
        activityIndicatorSet()
        fetchData()
        
    }
    
    func activityIndicatorSet() {
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func fetchData() {
        Service.shared.fetchPaidGames { searchApp, error in
            if let group = searchApp {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                }
                self.groups.append(group)
                self.groups.append(group)
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        Service.shared.fetchGames { searchApp, error in
            
            if let group = searchApp {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                }
                self.groups.append(group)
                self.groups.append(group)
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 290)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppsCollectionCell", for: indexPath) as! AppsCollectionCell
        let searchApp = groups[indexPath.item]
        cell.label.text = searchApp.feed.title
        cell.horizontalView.appGroup = searchApp
        cell.horizontalView.collectionView.reloadData()
        
        cell.horizontalView.didSelectHandler = { [weak self] feedResult in
            
            let controller = AppDetailController()
            controller.appId = feedResult.id
            controller.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(controller, animated: true)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 15, left: 0, bottom: 0, right: 0)
    }
    
}
