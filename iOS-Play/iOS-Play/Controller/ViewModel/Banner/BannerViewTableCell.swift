//
//  GenreViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/3/21.
//

import Foundation
import UIKit
import Reusable

final class BannerViewTableCell: UITableViewCell, Reusable {
    
    private let bannerView = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.gray.cgColor
    }
    
    private let bannerImage = UIImageView().then {
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let nameLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.bold.font(size: 20)
        $0.textColor = .darkGray
    }
    
    private let nameAuthorLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.regular.font(size: 16)
        $0.textColor = .darkGray
    }
    
    private let releaseLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.regular.font(size: 16)
        $0.textColor = .darkGray
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configViews()
    }
    
    func configViews() {
        contentView.addSubview(bannerView)
        contentView.addSubview(bannerImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameAuthorLabel)
        contentView.addSubview(releaseLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bannerView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(10)
        }
        
        bannerImage.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(bannerView).offset(1)
            make.height.equalTo(bannerView.snp.height).dividedBy(1.5)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(bannerImage.snp.bottom).offset(5)
            make.left.right.equalTo(bannerView).offset(20)
        }
        
        nameAuthorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.right.equalTo(bannerView).offset(20)
        }
        
        releaseLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameAuthorLabel.snp.bottom)
            make.left.right.equalTo(bannerView).offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: HighlightTableCellModel) {
        bannerImage.image = model.highlightImage
        nameLabel.text = model.name
        nameAuthorLabel.text = model.artistName
        releaseLabel.text = model.releaseDate
    }
    
}
