//
//  CollectionViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/3/21.
//

import Foundation
import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    private let appImage = UIImageView().then {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let nameAppLable = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.bold.font(size: 14)
        $0.textColor = .darkGray
    }
    
    private let nameAuthorLable = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.regular.font(size: 14)
        $0.textColor = .darkGray
    }
    
    private let releaseLable = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.regular.font(size: 14)
        $0.textColor = .darkGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        contentView.do {
            $0.addSubview(appImage)
            $0.addSubview(nameAppLable)
            $0.addSubview(nameAuthorLable)
            $0.addSubview(releaseLable)
        }
        
        appImage.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().inset(10)
            make.width.height.equalTo(100)
        }
        
        nameAppLable.snp.makeConstraints { (make) in
            make.top.equalTo(appImage.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
        
        nameAuthorLable.snp.makeConstraints { (make) in
            make.top.equalTo(nameAppLable.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
        
        releaseLable.snp.makeConstraints { (make) in
            make.top.equalTo(nameAuthorLable.snp.bottom)
            make.left.right.equalToSuperview().inset(10)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: CollectionTableCellModel) {
        appImage.image = model.image
        nameAppLable.text = model.appName
        nameAuthorLable.text = model.authorName
        releaseLable.text = model.release
    }
}
