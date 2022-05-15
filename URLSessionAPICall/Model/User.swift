//
//  User.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 16/01/22.
//

import Foundation


struct User: Codable {
    var total_count: Int
    var incomplete_results: Bool
    var items: [Search]
    
    
    enum CodingKeys: String, CodingKey {
        case total_count
        case incomplete_results
        case items
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_count = try values.decode(Int.self, forKey: .total_count)
        incomplete_results = try values.decode(Bool.self, forKey: .incomplete_results)
        items = try values.decode([Search].self, forKey: .items)
    }
}

struct Search: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var html_string: String?
    var url: String?
    var language: String?
    var open_issues: Int?
}
