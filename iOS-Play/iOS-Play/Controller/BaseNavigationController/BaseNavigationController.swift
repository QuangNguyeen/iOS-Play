//
//  BaseNaviController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 3/31/21.
//

import Foundation
import UIKit
import Then

final class BaseNavigationController: UINavigationController {
    
    private let userButton = UIButton(type: .custom).then {
        $0.backgroundColor = UIColor.systemPink
        $0.setTitle("Q", for: .normal)
        $0.layer.cornerRadius = 34 / 2
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
    }
    
    func configViews() {
        
        delegate = self
        
        navigationBar.do {
            $0.isTranslucent = false
            $0.backgroundColor = .white
            $0.addSubview(userButton)
        }
        
        userButton.do {
            
            $0.snp.makeConstraints { (make) in
                make.right.equalToSuperview().inset(10)
                make.bottom.equalToSuperview().inset(5)
                make.width.height.equalTo(34)
            }
            
            $0.addTarget(self, action: #selector(userTapped), for: .touchUpInside)
        }
    }
    
}

extension BaseNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
    }
    @objc func userTapped() {
        
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
