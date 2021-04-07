//
//  CellModel.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/2/21.
//

import Foundation
import UIKit

enum CellModel {
    case genreTitle (model: GenreModel)
    case collectionView(model: [CollectionTableCellModel])
    case highlightView(model: [HighlightTableCellModel])
    case bannerView(model: BannerTableCellModel)
    case listView(model: [ListTableCellModel])
}

struct GenreModel {
    let smallLabel: String
    let GenreLabel: String
}

struct ListTableCellModel {
    let title: String
}

struct CollectionTableCellModel {
    let title: String
    let image: UIImage
    let appName: String
    let authorName: String
    let release: String
}

struct HighlightTableCellModel {
    let title: String
    let image: UIImage
    let appName: String
    let authorName: String
    let release: String
    let highlightImage: UIImage
}

struct BannerTableCellModel {
    let title: String
    let bannerImage: UIImage
    let appName: String
    let authorName: String
    let release: String
}

enum HeightofCell {
    case genre
    case collection
    case highlight
    case banner

}
