//
//  ApiNetwork.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 13/11/24.
//

import Foundation

class ApiNetwork {
    
    struct HeroResponse: Codable {
        let response: String
        let results: [Superhero]
    }
    
    struct Superhero: Codable, Identifiable {
        let id: String
        let name: String
        let image: ImageSuperhero
    }
    
    struct ImageSuperhero: Codable {
        let url: String
    }
    
    func getHeroesByQuery(query: String) async throws -> HeroResponse {
        
        let token: String = "7cef8e360e10c6c38477b9314a2299eb"
        
        let url = URL(string: "https://superheroapi.com/api/\(token)/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(HeroResponse.self, from: data)
        
        return response
    }
    
    struct SuperherCompleted: Codable {
        let id: String
        let name: String
        let image: ImageSuperhero
        let powerstats: PowerStats
        let biography: Biography
    }
    
    struct PowerStats: Codable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography: Codable {
        let fullName: String
        let aliases: [String]
        let publisher: String
        let alignment: String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full-name"
            case aliases = "aliases"
            case publisher = "publisher"
            case alignment = "alignment"
        }
    }
    
    func getSuperheroById(id: String) async throws -> SuperherCompleted {
        
        let token: String = "7cef8e360e10c6c38477b9314a2299eb"
        
        let url = URL(string: "https://superheroapi.com/api/\(token)/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(SuperherCompleted.self, from: data)
        
    }
}
