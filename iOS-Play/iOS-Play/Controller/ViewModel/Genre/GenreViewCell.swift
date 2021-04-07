//
//  GenreViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/3/21.
//

import Foundation
import UIKit


final class GenreViewCell: UITableViewCell {
    
    private let genreLabel = UILabel().then {
        $0.font = FontFamily.Arvo.regular.font(size: 18)
        $0.textColor = .black
    }
    
    private let smallLabel = UILabel().then {
        $0.font = FontFamily.Arvo.regular.font(size: 9)
        $0.textColor = .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configViews()
    }
    
    func configViews() {
        contentView.addSubview(genreLabel)
        contentView.addSubview(smallLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        smallLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().inset(10)
            make.bottom.equalTo(genreLabel.snp.bottom)
        }
        
        genreLabel.snp.makeConstraints { (make) in
            make.left.equalTo(smallLabel.snp.right).offset(10)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: GenreModel){
        smallLabel.text = model.smallLabel
        genreLabel.text = model.GenreLabel
    }
    
}
