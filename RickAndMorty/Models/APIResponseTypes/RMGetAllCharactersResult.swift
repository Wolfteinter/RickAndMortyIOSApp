//
//  RMGetAllCharactersResult.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 04/03/23.
//

import Foundation

struct RMGetAllCharactersResponse: Codable{
    struct Info: Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
        
    }
    let info: Info
    let results: [RMCharacter]
}

