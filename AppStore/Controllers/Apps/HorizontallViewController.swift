//
//  HorizontallViewController.swift
//  AppStore
//
//  Created by ericzero on 1/2/23.
//

import UIKit

class HorizontalViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var appGroup: AppResult?
    
    var didSelectHandler: ((FeedResult) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(HorizontalCollectionCell.self, forCellWithReuseIdentifier: "HorizontalCollectionCell")
        collectionView.showsHorizontalScrollIndicator = false
                
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appGroup?.feed.results[indexPath.row] {
            didSelectHandler?(app)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionCell", for: indexPath) as! HorizontalCollectionCell
        cell.updateCell(data: (appGroup?.feed.results[indexPath.item])!)
        return cell
    }
    
    let topBotttomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBotttomPadding - 2 * lineSpacing) / 3
        return .init(width: view.frame.width - 45, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBotttomPadding, left: 10, bottom: topBotttomPadding, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
}
