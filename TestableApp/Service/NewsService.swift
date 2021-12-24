//
//  NewsService.swift
//  SUI3Test
//
//  Created by Viktor Kushnerov on 24.12.21.
//

import AsyncCompatibilityKit
import Foundation
import Resolver

enum Network: Error {
    case InvalidURL
}

class NewsService: ObservableObject {
    @Published var news: [NewsModel] = []

    @Injected private var loading: Loading<[NewsModel]>

    @MainActor
    func fetchAllNews() async throws {
        news = try await loading()
    }
}

extension NewsService {
    static func initLoader() -> Loading<[NewsModel]> {
        {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json") else {
                throw Network.InvalidURL
            }

            let (data, _) = try await URLSession.shared.data(from: url)

            return try JSONDecoder().decode([NewsModel].self, from: data)
        }
    }
}

extension NewsService {
    static func mockLoader() -> Loading<[NewsModel]> {
        {
            [
                .init(id: 1, title: "name1"),
                .init(id: 2, title: "name2")
            ]
        }
    }
}
