//
//  TableCollectionViewSection.swift
//  NewsApp
//
//  Created by Viki on 06/01/2024.
//

import Foundation

protocol TableCollectionViewItemsProtocol { }

struct TableCollectionViewSection {
    var title: String?
    var items: [TableCollectionViewItemsProtocol]
}
