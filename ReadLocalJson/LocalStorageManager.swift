//
//  LocalStorageManager.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 02/06/22.
//

import Foundation

struct Country: Decodable {
    let flag: String?
    let country: String?
    let countryName: String?
}

struct Human: Decodable {
    let name: String?
    let employed: String?
    let age: Int?
}

struct PersonResponse: Decodable {
    let person: [Human]
}

struct PersonCountryResponse: Decodable {
    let person: [Human]
    let country: [Country]
}

struct CommonResponse: Decodable {
    let common: PersonCountryResponse
}

class LocalStorageManager {
    
    func readLocalfile<T: Decodable>(file: String, type: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: file, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                return jsonData
            } catch {
                print("File not found")
            }
        }
        return nil
    }
}
