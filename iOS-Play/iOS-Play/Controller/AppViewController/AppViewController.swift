//
//  AppViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 3/31/21.
//

import Foundation
import UIKit

//MARK: - AppViewController
final class AppViewController: UIViewController {
    
    private let searchBar = UISearchBar()
    
    private let segmentItems = FeedType.apps.item
    
    private var itemPicked: [Bool] = {
        var item = [Bool](repeating: false, count: FeedType.apps.item.count)
        item[0] = true
        return item
    }()
    
    
    private let segmentCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 100, height: 40)
            $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            $0.minimumLineSpacing = 1
            $0.minimumInteritemSpacing = 1
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellType: SegmentCollectionCell.self)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var childView = [UIViewController]()
    
    private let pageController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal,
                                                      options: nil).then {
                                                        $0.view.backgroundColor = .white
                                                      }
    
    private var currentPageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        configSearchBar()
        
        configChildView()
        configPageView()
    }
    
    func configViews() {
        view.backgroundColor = .white
        
        segmentCollection.delegate = self
        segmentCollection.dataSource = self
        
        pageController.delegate = self
        pageController.dataSource = self
    }
    
    func configSearchBar() {
        let witdh = view.bounds.width - 30 - 10 - 10 - 10
        let frame = CGRect(x: 0, y: 0, width: witdh, height: 44)
        let titleBar = UIView(frame: frame)
        searchBar.frame = frame
        
        searchBar.delegate = self
        titleBar.addSubview(searchBar)
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: witdh + 60, height: 44))
        titleView.addSubview(titleBar)
        
        navigationItem.titleView = titleView
    }
    
    func configChildView() {
        let newGameVC = NewGameViewController()
        let newAppVC = TopAppViewController()
        let topFreeVC = TopAppViewController()
        let topFreeIpadVC = TopAppViewController()
        let topGrossingVC = TopAppViewController()
        let topGrossingIpadVC = TopAppViewController()
        let topPaidVC = TopAppViewController()
        
        newGameVC.view.tag = 0
        newAppVC.view.tag = 1
        topFreeVC.view.tag = 2
        topFreeIpadVC.view.tag = 3
        topGrossingVC.view.tag = 4
        topPaidVC.view.tag = 5
        
        childView = [newGameVC,
                     newAppVC,
                     topFreeVC,
                     topFreeIpadVC,
                     topGrossingVC,
                     topGrossingIpadVC,
                     topPaidVC]
    }
    
    func configPageView() {
        view.addSubview(segmentCollection)
        view.addSubview(pageController.view)
        
        segmentCollection.do {
            $0.snp.makeConstraints { (make) in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(40)
            }
        }
        
        pageController.do {
            
            $0.setViewControllers([childView[currentPageIndex]],
                                  direction: .forward, animated: true, completion: nil)
            
            $0.view.snp.makeConstraints { (make) in
                make.top.equalTo(segmentCollection.snp.bottom).offset(0)
                make.left.bottom.right.equalToSuperview()
            }
            
            $0.didMove(toParent: self)
        }
        addChild(pageController)
        
        
        //remove swipeGesture
        for view in self.pageController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
    
}

//MARK: - Search Bar Delegate
extension AppViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.showsCancelButton = false
        //hide keyboard when tapped cancel
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
}

//MARK: - Segment CollectionView Delegate, DataSource
extension AppViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return segmentItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as SegmentCollectionCell
        cell.configure(title: segmentItems[indexPath.row],
                       color: UIColor.white,
                       picked: itemPicked[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let itempick = [Bool](repeating: false, count: FeedType.apps.item.count + 1)
        self.itemPicked = itempick
        self.itemPicked[indexPath.row] = true
        
        collectionView.reloadData()
        
        //push page view controller
        let nextIndex = indexPath.row
        let direction = nextIndex < currentPageIndex
            ? UIPageViewController.NavigationDirection.reverse
            : UIPageViewController.NavigationDirection.forward
        pageController.setViewControllers([childView[nextIndex]], direction: direction, animated: true, completion: nil)
        currentPageIndex = nextIndex
        //*
    }
}

//MARK: - Page ViewController
extension AppViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        currentPageIndex = viewController.view.tag
        let beforeIndex = viewController.view.tag - 1
        if beforeIndex < 0 { return nil }
        return childView[beforeIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        currentPageIndex = viewController.view.tag
        let afterIndex = viewController.view.tag + 1
        if afterIndex > childView.count - 1 { return nil }
        return childView[afterIndex]
    }
}
