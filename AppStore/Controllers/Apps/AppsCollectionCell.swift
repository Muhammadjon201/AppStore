//
//  AppsCollectionCell.swift
//  AppStore
//
//  Created by ericzero on 1/2/23.
//

import UIKit
import SnapKit

class AppsCollectionCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "App Section"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let horizontalView = HorizontalViewController()
    
    func setUpConstraints() {
        addSubview(label)
        addSubview(horizontalView.view)
       // horizontalView.view.backgroundColor = .green
        
        label.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(20)
            make.right.equalTo(-5)
        }
        
        horizontalView.view.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.left.equalTo(5)
            make.right.bottom.equalTo(-5)
        }
    }
    
    func updateCell(data: AppResult) {
        label.text = data.feed.title
    }
    
}












