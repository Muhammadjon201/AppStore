//
//  AppHeaderViewCell.swift
//  AppStore
//
//  Created by ericzero on 1/3/23.
//

import UIKit
import SnapKit

// This cell represents Cell of Header view..

class AppHeaderViewCell: UICollectionViewCell {
    
    lazy var companyLabel:UILabel = {
        let companyLabel = UILabel()
        companyLabel.text = "Facebook"
        companyLabel.font = .systemFont(ofSize: 14, weight: .medium)
        companyLabel.numberOfLines = 0
        companyLabel.textColor = .systemBlue
        return companyLabel
    }()
    
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "We connect the world together with anyone"
        titleLabel.font = .systemFont(ofSize: 17, weight: .medium)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    lazy var verticalStack: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.spacing = 10
        verticalStack.distribution = .equalSpacing
        return verticalStack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        setConstraints()
    }
    
    func setConstraints(){
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(companyLabel)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(imageView)
        
        verticalStack.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.left.equalTo(16)
            make.right.equalTo(-1)
            make.bottom.equalTo(-16)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(180)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
