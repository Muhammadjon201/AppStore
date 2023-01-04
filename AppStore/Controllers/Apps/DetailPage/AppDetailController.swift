//
//  AppDetailController.swift
//  AppStore
//
//  Created by ericzero on 1/4/23.
//

import UIKit
import SnapKit

class AppDetailController: BaseListController {
    
    var appId: String! {
        didSet{
            print("Here is id", appId)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
    }
    
}
