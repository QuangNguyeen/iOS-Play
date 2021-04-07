//
//  DataTest.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/5/21.
//

import Foundation
import UIKit

class DataMock {
    
    static var shared = DataMock()
    
    func getDataTest() -> [CellModel] {
        var models = [CellModel]()
        
        models.append(.genreTitle(model: GenreModel(smallLabel: "", GenreLabel: "New Game")))
        
        models.append(.collectionView(model: [
            CollectionTableCellModel(title: "Brawhlalla",
                                     image:Asset.braw.image,
                                     appName: "Brawlhalla",
                                     authorName: "SheepofG",
                                     release: "05.01.99"),
            CollectionTableCellModel(title: "Brawhlalla",
                                     image:Asset.ghenshin.image,
                                     appName: "GhenShin Impact",
                                     authorName: "SheepofG",
                                     release: "05.01.99"),
            CollectionTableCellModel(title: "Brawhlalla",
                                     image:Asset.loll.image,
                                     appName: "Wild Rift",
                                     authorName: "SheepofG",
                                     release: "05.01.99"),
            CollectionTableCellModel(title: "Brawhlalla",
                                     image:Asset.fifa.image,
                                     appName: "FiFa Online 4",
                                     authorName: "SheepofG",
                                     release: "05.01.99"),
        ]))
        
        models.append(.collectionView(model: [
            CollectionTableCellModel(title: "Brawhlalla",
                                     image:Asset.braw.image,
                                     appName: "Brawlhalla",
                                     authorName: "SheepofG",
                                     release: "05.01.99"),
            CollectionTableCellModel(title: "Brawhlalla",
                                     image:Asset.ghenshin.image,
                                     appName: "GhenShin Impact",
                                     authorName: "SheepofG",
                                     release: "05.01.99"),
            CollectionTableCellModel(title: "Brawhlalla",
                                     image:Asset.loll.image,
                                     appName: "Wild Rift",
                                     authorName: "SheepofG",
                                     release: "05.01.99"),
            CollectionTableCellModel(title: "Brawhlalla",
                                     image:Asset.fifa.image,
                                     appName: "FiFa Online 4",
                                     authorName: "SheepofG",
                                     release: "05.01.99"),
        ]))
        
        models.append(.genreTitle(model: GenreModel(smallLabel: "Adventisment", GenreLabel: "Recomended to you")))
        
        models.append(.bannerView(model: BannerTableCellModel(title: "LMAO",
                                                            bannerImage: Asset.banner5.image,
                                                            appName: "Brawlhalla",
                                                            authorName: "SheepofG",
                                                            release: "01.04.2020")
        ))
        
        models.append(.genreTitle(model: GenreModel(smallLabel: "From SheepofG", GenreLabel: "Recomended to you")))
        
        models.append(.highlightView(model: [
            HighlightTableCellModel(title: "LOL",
                                    image: Asset.loll.image,
                                    appName: "Wild Rift",
                                    authorName: "SheepofG",
                                    release: "05.01.99",
                                    highlightImage: Asset.loLbanner.image),
            HighlightTableCellModel(title: "LOL",
                                    image: Asset.ghenshin.image,
                                    appName: "GhenShon Impact",
                                    authorName: "SheepofG",
                                    release: "05.01.99",
                                    highlightImage: Asset.banner1.image),
            HighlightTableCellModel(title: "LOL",
                                    image: Asset.fifa.image,
                                    appName: "Fifa Online 4",
                                    authorName: "SheepofG",
                                    release: "05.01.99",
                                    highlightImage: Asset.banner2.image)
        ]))
        
        models.append(.genreTitle(model: GenreModel(smallLabel: "", GenreLabel: "Thể loại")))
        
        models.append(.listView(model: [
            ListTableCellModel(title: "Phiêu lưu"),
            ListTableCellModel(title: "Nhập vai"),
            ListTableCellModel(title: "Bắn súng"),
            ListTableCellModel(title: "Đá bóng"),
            ListTableCellModel(title: "Xếp hình"),
        ]))

        return models
    }
}
