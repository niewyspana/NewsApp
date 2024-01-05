//
//  NewsResponseObject.swift
//  NewsApp
//
//  Created by Viki on 31/12/2023.
//

import Foundation

struct NewsResponseObject: Codable {
    
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
    
}
