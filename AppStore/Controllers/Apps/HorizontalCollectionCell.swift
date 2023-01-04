//
//  HorizontalCollectionCell.swift
//  AppStore
//
//  Created by ericzero on 1/2/23.
//

import UIKit
import SDWebImage

class HorizontalCollectionCell: UICollectionViewCell {
    
    lazy var verticalStack: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.spacing = 5
        return verticalStack
    }()
    
    lazy var horizontalStack: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .center
        horizontalStack.spacing = 10
        horizontalStack.distribution = .fillProportionally
        return horizontalStack
    }()
    
    lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.clipsToBounds = true
        iconView.backgroundColor = .systemBlue
        iconView.layer.cornerRadius = 12
        iconView.contentMode = .scaleAspectFill
        return iconView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 1
        nameLabel.text = "The witness"
//        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        return nameLabel
    }()
    
    lazy var companyLabel: UILabel = {
        let companyLabel = UILabel()
        companyLabel.numberOfLines = 1
        companyLabel.text = "The dark company"
        companyLabel.font = .systemFont(ofSize: 13, weight: .regular)
//        companyLabel.textColor = .systemGray5
        return companyLabel
    }()
    
    lazy var getButton: UIButton = {
        let getButton = UIButton(type: .system)
        getButton.setTitle("GET", for: .normal)
        getButton.setTitleColor(.systemBlue, for: .normal)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        getButton.backgroundColor = .systemGray5
        getButton.clipsToBounds = true
        getButton.layer.cornerRadius = 15
        return getButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(iconView)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(companyLabel)
        horizontalStack.addArrangedSubview(getButton)
        
        horizontalStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        iconView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(iconView.snp.height)
        }
        
        getButton.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
        
    }
    
    func updateCell(data: FeedResult){
        nameLabel.text = data.artistName
        companyLabel.text = data.name
        iconView.sd_setImage(with: URL(string: "\(data.artworkUrl100 ?? "")"), placeholderImage: UIImage(named: "placeholder"))    }
}
