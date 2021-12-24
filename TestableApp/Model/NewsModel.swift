//
//  NewsModel.swift
//  SUI3Test
//
//  Created by Viktor Kushnerov on 24.12.21.
//

import Foundation

// https://hws.dev/news-1.json

struct NewsModel: Identifiable, Decodable {
    let id: Int
    let title: String
}
