//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 13/02/23.
//

import Foundation

struct RMEpiside: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
