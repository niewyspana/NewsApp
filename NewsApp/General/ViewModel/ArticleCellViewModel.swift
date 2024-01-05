//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by Viki on 31/12/2023.
//

import Foundation

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    
    let imageUrl: String
    var imageData: Data?
    
    init(article: ArticleResponseObject) {
        title = article.title
        description = article.description ?? ""
        date = article.date
        imageUrl = article.urlToImage ?? ""
    }
}
