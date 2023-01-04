//
//  AppsHeaderView.swift
//  AppStore
//
//  Created by ericzero on 1/3/23.
//

import UIKit
import SnapKit

// Collection View Controller for Header View..

class AppsHeaderView: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var socialApp = [SocialApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(AppHeaderViewCell.self, forCellWithReuseIdentifier: "AppHeaderViewCell")
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        fetchSocialApp()
    }
    
    func fetchSocialApp(){
        Service.shared.fetchingHeaderApp { result, Error in
            if let Error = Error {
                print("error happened", Error)
            }
            self.socialApp = result!
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApp.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppHeaderViewCell", for: indexPath) as! AppHeaderViewCell
        cell.companyLabel.text = socialApp[indexPath.row].name
        cell.titleLabel.text = socialApp[indexPath.row].tagline
        cell.imageView.sd_setImage(with: URL(string: socialApp[indexPath.row].imageUrl), placeholderImage: UIImage(named: "placeholder"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 45, height: view.frame.height)
    }
    
}
