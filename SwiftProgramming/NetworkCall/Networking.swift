//
//  Networking.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 25/09/21.
//

//https://www.youtube.com/watch?v=YY3bTxgxWss
import UIKit

struct Source: Decodable {
    let id: String?
    let name: String?
}

struct Article: Decodable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
}

struct ArticleList: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}


class Networking {
    func fetchDataWithURL() {
        guard let url = URL(string: "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(ArticleList.self, from: data)
                print(result)
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
}

