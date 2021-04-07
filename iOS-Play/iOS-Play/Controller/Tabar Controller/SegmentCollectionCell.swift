//
//  SegmentCollectionView.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/2/21.
//

import Foundation
import UIKit

final class SegmentCollectionCell: UICollectionViewCell {  
    
    let bottomView = UIView().then {
        $0.layer.cornerRadius = 3
    }
    
    let customView = UIView().then {
        $0.backgroundColor = .white
    }
    
    var titleLabel = UILabel().then {
        $0.numberOfLines = 1
        $0.clipsToBounds = true
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.layer.cornerRadius = 2
   
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(bottomView)
        addSubview(customView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        
        titleLabel.snp.makeConstraints {
            $0.top.right.left.bottom.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(2)
            make.height.equalTo(5)
        }
        
        customView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(-4)
            make.height.equalTo(3)
        }
    }

    public func configure(title: String, color: UIColor, picked: Bool) {
        titleLabel.text = title
        
        bottomView.backgroundColor = picked ? .systemPink : color
        titleLabel.textColor = picked ? .systemPink : .darkGray
    }
}
