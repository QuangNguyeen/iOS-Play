//
//  NewGameViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/2/21.
//

import Foundation
import UIKit

final class NewGameViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(cellType: UITableViewCell.self)
        $0.register(cellType: CollectionTableViewCell.self)
        $0.register(cellType: GenreViewCell.self)
        $0.register(cellType: HighlighTableViewCell.self)
        $0.register(cellType: BannerViewTableCell.self)
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.separatorColor = .clear
    }
    
    private let dataTest = DataMock.shared
    
    private var models = [CellModel]()
    
    private let heightOfGenre: CGFloat = 30
    private let heightOfCollection: CGFloat = 200
    private let heightOfHighlight: CGFloat = 350
    private let heightOfBanner: CGFloat = 310
    private let heightOfList: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        //configCellModell()
        models = dataTest.getDataTest()
    }
    
    func configViews() {
        view.backgroundColor = .white
        
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
        }
        
        view.addSubview(tableView)
        
        tableView.do {
            $0.snp.makeConstraints { (make) in
                make.bottom.left.top.right.equalToSuperview()
            }
        }
    }
    
    func configCellModell() {
        models = dataTest.getDataTest()
    }
}


extension NewGameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .genreTitle: return 1
        case .collectionView: return 1
        case .highlightView: return 1
        case .bannerView: return 1
        case .listView(model: let models): return models.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .genreTitle(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as GenreViewCell
            cell.do {
                $0.configure(with: model)
                $0.accessoryType = .disclosureIndicator
            }
            return cell
            
        case .collectionView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as CollectionTableViewCell
            cell.do {
                $0.configureData(with: models)
                $0.delegate = self
            }
            return cell
            
        case .bannerView(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as BannerViewTableCell
            cell.configure(with: model)
            return cell
            
        case .highlightView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as HighlighTableViewCell
            cell.do {
                $0.configureData(with: models)
                $0.delegate = self
            }
            return cell
            
        case .listView(let models):
            let model = models[indexPath.row]
            let cell = tableView.dequeueReusableCell(for: indexPath) as UITableViewCell
            cell.textLabel?.do {
                $0.text = model.title
                $0.font = FontFamily.Arvo.regular.font(size: 16)
                $0.textColor = .gray
            }
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .genreTitle: return heightOfGenre
        case .collectionView: return heightOfCollection
        case .bannerView: return heightOfBanner
        case .highlightView: return heightOfHighlight
        case .listView: return heightOfList
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch models[indexPath.section] {
        case .bannerView:
            let vc = DetailAppViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .listView:
            let vc = DetailAppViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

extension NewGameViewController: CollectionTableViewCellDelegate {
    func didSelectCell() {
        let vc = DetailAppViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
