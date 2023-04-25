//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 13/02/23.
//

import Foundation

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let image: String
    let episode: [String]
    let created: String
    let origin: RMOrigin
    let location: RMSingleLocation
}

