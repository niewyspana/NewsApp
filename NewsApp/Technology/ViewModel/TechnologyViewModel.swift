//
//  TechnologyViewModel.swift
//  NewsApp
//
//  Created by Viki on 06/01/2024.
//

import UIKit

final class TechnologyViewModel: NewsListViewModel {
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        
        ApiManager.getNews(from: .technology, page: page, searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
}
