//
//  NetworkingError.swift
//  NewsApp
//
//  Created by Viki on 31/12/2023.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
