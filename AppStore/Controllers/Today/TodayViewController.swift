//
//  TodayViewController.swift
//  AppStore
//
//  Created by ericzero on 12/26/22.
//

import UIKit

class TodayViewController: BaseListController, UICollectionViewDelegateFlowLayout {
            
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemGray6
        collectionView.register(TodayCollectionCell.self, forCellWithReuseIdentifier: "TodayCollectionCell")
        navigationController?.isNavigationBarHidden = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    var todayDetailVC: UIViewController!
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let todayDetailVC = TodayDetailController()
        let redView = todayDetailVC.view!
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoving)))
        view.addSubview(redView)
        
        addChild(todayDetailVC)
        
        self.todayDetailVC = todayDetailVC
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        // cordinates cell
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        redView.layer.cornerRadius = 16
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            redView.frame = self.view.frame
          
            self.tabBarController?.tabBar.isHidden = true
        }, completion: nil)
    }
    
    var startingFrame: CGRect?
    
    // removing
    @objc func handleRemoving(gesture: UIRotationGestureRecognizer){
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            gesture.view?.frame = self.startingFrame ?? .zero
            
            self.tabBarController?.tabBar.isHidden = false

        }, completion: { _ in
            gesture.view?.removeFromSuperview()
            self.todayDetailVC.removeFromParent()
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayCollectionCell", for: indexPath) as! TodayCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 60, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 30, left: 0, bottom: 30, right: 0)
    }

}
