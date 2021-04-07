//
//  HighlightViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/3/21.
//

import Foundation
import UIKit

final class HighlightCollectionViewCell: UICollectionViewCell {

    let highlightImage = UIImageView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        $0.contentMode = .scaleAspectFill
    }
    
    private let appImage = UIImageView().then {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let appNameLable = UILabel().then {
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
        configViews()
    }
    
    func configViews() {
        contentView.addSubview(highlightImage)
        contentView.addSubview(appImage)
        contentView.addSubview(appNameLable)
        contentView.addSubview(nameAuthorLable)
        contentView.addSubview(releaseLable)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        highlightImage.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().inset(10)
            make.width.equalTo(300)
            make.height.equalTo(150)
        }
        
        appImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(80)
            make.top.equalTo(highlightImage.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(10)
        }
        
        appNameLable.snp.makeConstraints { (make) in
            make.top.equalTo(highlightImage.snp.bottom).offset(10)
            make.left.equalTo(appImage.snp.right).offset(20)
            make.right.equalToSuperview()
        }
        
        nameAuthorLable.snp.makeConstraints { (make) in
            make.top.equalTo(appNameLable.snp.bottom).offset(10)
            make.left.equalTo(appImage.snp.right).offset(20)
            make.right.equalToSuperview()
        }
        
        releaseLable.snp.makeConstraints { (make) in
            make.top.equalTo(nameAuthorLable.snp.bottom)
            make.left.equalTo(appImage.snp.right).offset(20)
            make.right.equalToSuperview()
        }
    }
    
    func configure (with model: HighlightTableCellModel) {
        highlightImage.image = model.highlightImage
        appImage.image = model.image
        appNameLable.text = model.appName
        nameAuthorLable.text = model.authorName
        releaseLable.text = model.release
    }
}
