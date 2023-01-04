//
//  SearchViewCell.swift
//  AppStore
//
//  Created by ericzero on 12/27/22.
//

import UIKit
import SnapKit
import SDWebImage

class SearchViewCell: UICollectionViewCell {
    
    // UI Elements 
    
    lazy var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        imageV.layer.cornerRadius = 12
        return imageV
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 1
        return nameLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 1
        descriptionLabel.font = .systemFont(ofSize: 15)
        return descriptionLabel
    }()
    
    lazy var ratingLabel: UILabel = {
        let ratingLabel = UILabel()
        ratingLabel.numberOfLines = 1
        ratingLabel.font = .systemFont(ofSize: 15)
        ratingLabel.textColor = .systemGray
        return ratingLabel
    }()
    
    lazy var getButton: UIButton = {
        let getButton = UIButton(type: .system)
        getButton.setTitle("GET", for: .normal)
        getButton.setTitleColor(.systemBlue, for: .normal)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        getButton.backgroundColor = .systemGray5
        getButton.clipsToBounds = true
        getButton.layer.cornerRadius = 12
        return getButton
    }()
    
    lazy var verticalStack: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.spacing = 2
        return verticalStack
    }()
    
    lazy var horizontalStack: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fillProportionally
        horizontalStack.spacing = 12
        horizontalStack.alignment = .center
        return horizontalStack
    }()
    
    lazy var overallStack: UIStackView = {
        let overallStack = UIStackView()
        overallStack.axis = .vertical
        overallStack.spacing = 20
        return overallStack
    }()
    
    lazy var screenshotStackView: UIStackView = {
        let screenshotStackView = UIStackView()
        screenshotStackView.axis = .horizontal
        screenshotStackView.distribution = .fillEqually
        screenshotStackView.spacing = 10
        screenshotStackView.clipsToBounds = true
        return screenshotStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.4, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    func constraints() {
        
        addSubview(overallStack)
        //addSubview(getButton)
        overallStack.addArrangedSubview(horizontalStack)
        overallStack.addArrangedSubview(screenshotStackView)
        horizontalStack.addArrangedSubview(imageV)
        horizontalStack.addArrangedSubview(verticalStack)
        horizontalStack.addArrangedSubview(getButton)
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(descriptionLabel)
        verticalStack.addArrangedSubview(ratingLabel)
        screenshotStackView.addArrangedSubview(screenshot1ImageView)
        screenshotStackView.addArrangedSubview(screenshot2ImageView)
        screenshotStackView.addArrangedSubview(screenshot3ImageView)
        
        overallStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
            
        }
        
        imageV.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(imageV.snp.width)
        }
        
        getButton.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
        
    }
    
    // MARK: - Update Cell function 
    
    func updateCell(data: Result) {
        nameLabel.text = data.trackName ?? ""
        descriptionLabel.text = data.primaryGenreName
        ratingLabel.text = "Rating: \(data.averageUserRating ?? 0)"
        imageV.sd_setImage(with: URL(string: data.artworkUrl100 ?? ""), placeholderImage: UIImage(named: "placeholder"))
        
        // screenshots
        
        screenshot1ImageView.sd_setImage(with: URL(string: data.screenshotUrls[0]), placeholderImage: UIImage(named: "placeholder"))
        
        if data.screenshotUrls.count > 1 {
            screenshot2ImageView.sd_setImage(with: URL(string: data.screenshotUrls[1]), placeholderImage: UIImage(named: "placeholder"))
        }
        if data.screenshotUrls.count > 2 {
            screenshot3ImageView.sd_setImage(with: URL(string: data.screenshotUrls[2]), placeholderImage: UIImage(named: "placeholder"))
        }
    }
    
}
