//
//  TodayCollectionCell.swift
//  AppStore
//
//  Created by ericzero on 1/2/23.
//

import UIKit

class TodayCollectionCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "angrybirds")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    lazy var arcadeLabel: UILabel = {
        let label = UILabel()
        label.text = "APPLE ARCADE"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .systemGray3
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Apple Arcade Games"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Play the world's best bird flinging, pig popping game!"
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layer.cornerRadius = 12
        setUp()
    }
    
    func setUp(){
        addSubview(titleLabel)
        addSubview(arcadeLabel)
        addSubview(imageView)
        addSubview(descriptionLabel)
    
        arcadeLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.equalTo(imageView.snp.left)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(arcadeLabel.snp.bottom).offset(10)
            make.left.equalTo(imageView.snp.left)
        }
        imageView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(220)
            make.width.equalTo(320)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-30)
            make.left.equalTo(imageView.snp.left)
            make.right.equalTo(imageView.snp.right)

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
