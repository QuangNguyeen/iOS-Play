//
//  CollectionViewTableCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/2/21.
//

import Foundation
import UIKit

final class HighlighTableViewCell: UITableViewCell {
    
    public weak var delegate: CollectionTableViewCellDelegate?
    
    private var models = [HighlightTableCellModel]()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 310,
                                 height: 310)
            $0.sectionInset = UIEdgeInsets(top: 0,
                                           left: 10,
                                           bottom: 0,
                                           right: 10)
            $0.minimumLineSpacing = 10
            $0.minimumInteritemSpacing = 1
        }
        
        let collectionview = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionview.register(cellType: HighlightCollectionViewCell.self)
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.showsVerticalScrollIndicator = false
        return collectionview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configViews()
    }
    
    func configViews() {
        
        collectionView.do {
            $0.backgroundColor = .white
            $0.delegate = self
            $0.dataSource = self
        }
    
        contentView.addSubview(collectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureData(with models: [HighlightTableCellModel]) {
        self.models = models
        collectionView.reloadData()
    }
    
}

extension HighlighTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(for: indexPath) as HighlightCollectionViewCell
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didSelectCell()
    }
}
