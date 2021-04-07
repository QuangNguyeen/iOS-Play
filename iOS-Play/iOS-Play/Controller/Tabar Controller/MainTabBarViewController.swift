//
//  MainTabBarViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 3/31/21.
//

import Foundation
import UIKit

final class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
            
        configureViews()
    }
    
    func configureViews() {
        tabBar.do {
            $0.barTintColor = UIColor.white
            $0.clipsToBounds = true
        }
        
        viewControllers = [
            configChildNavigationController(vc: AppViewController(), item: TabbarItem.apps.item),
            configChildNavigationController(vc: MusicViewController(), item: TabbarItem.musics.item),
            configChildNavigationController(vc: MovieViewController(), item: TabbarItem.movies.item),
            configChildNavigationController(vc: BookViewController(), item: TabbarItem.books.item),
            configChildNavigationController(vc: TVShowViewController(), item: TabbarItem.tvShows.item)
        ]
    }

    func configChildNavigationController(vc: UIViewController, item: UITabBarItem) -> UINavigationController {
        let navController = BaseNavigationController(rootViewController: vc)
        vc.tabBarItem = item
        return navController
    }
}
