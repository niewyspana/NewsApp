//
//  ArticleResponseObject.swift
//  NewsApp
//
//  Created by Viki on 31/12/2023.
//

import Foundation
import UIKit

struct ArticleResponseObject: Codable {
    let title: String
    let description: String?
    let urlToImage: String?
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case date = "publishedAt"
    }
}
