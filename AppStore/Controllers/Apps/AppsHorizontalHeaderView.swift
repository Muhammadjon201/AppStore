//
//  AppsHorizontalHeaderView.swift
//  AppStore
//
//  Created by ericzero on 1/3/23.
//

import UIKit
import SnapKit

// This view is headerView for nesting AppHeaderView..

class AppsHorizontalHeaderView: UICollectionReusableView {
    
    let appHeaderHorizontalController = AppsHeaderView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    func constraints() {
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.snp.makeConstraints { make in
            make.top.left.equalTo(1)
            make.right.bottom.equalTo(-1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
