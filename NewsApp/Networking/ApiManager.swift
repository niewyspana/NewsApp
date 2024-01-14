//
//  ApiManager.swift
//  NewsApp
//
//  Created by Viki on 31/12/2023.
//

import Foundation

final class ApiManager {
    enum Category: String {
        case general = "general"
        case business = "business"
        case technology = "technology"
    }
    
    private static let apiKey = "9e9d3de308eb42c6a89323b90c644b81"
    private static let baseUrl = "https://newsapi.org/v2/"
    private static let path = "top-headlines"
    
    
    // create url path and make request
    static func getNews(from category: Category, page: Int, searchText: String?, completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        var searchParameter = ""
        if let searchText = searchText {
            searchParameter = "&q=\(searchText)"
        }
        
        
        let stringUrl = baseUrl + path + "?category=\(category.rawValue)&language=en&page=\(page)" + searchParameter + "&apiKey=\(apiKey)"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _,
                                                              error in
            handleResponse(data: data, error: error, completion: completion)
        }
        session.resume()
    }
    
    static func getImageData(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _,
                                                              error in
            if let data = data {
                completion(.success(data))
            }
            if let error = error {
                completion(.failure(error))
            }
        }
        session.resume()
    }
    
    // handle response
    private static func handleResponse(data: Data?,
                                       error: Error?,
                                       completion: @escaping
                                        (Result<[ArticleResponseObject], Error>) -> ()) {
        if let error = error {
            completion(.failure(NetworkingError.networkingError(error)))
        } else if let data = data {
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON response: \(jsonString)")
            } else {
                print("Failed to convert data to UTF-8 string")
            }
            do {
                let model = try JSONDecoder().decode(NewsResponseObject.self,
                                                     from: data)
                completion(.success(model.articles))
            }
            catch let decodeError {
                completion(.failure(decodeError))
            }
        } else {
            completion(.failure(NetworkingError.unknown))
        }
    }
}
