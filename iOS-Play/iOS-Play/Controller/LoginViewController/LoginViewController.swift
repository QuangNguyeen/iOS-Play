//
//  LoginViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/1/21.
//

import Foundation
import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private let backButton = UIButton(type: .custom).then {
        $0.backgroundColor = UIColor.systemPink
        $0.setImage(Asset.back.image, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
    }
    
    func configViews() {
        view.backgroundColor = .white
        
        view.addSubview(backButton)
        
        backButton.do {
            
            $0.snp.makeConstraints { (make) in
                make.top.equalToSuperview().inset(60)
                make.left.equalToSuperview().inset(20)
                make.width.height.equalTo(30)
            }
            
            $0.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        }
    }
    
    @objc func backTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
