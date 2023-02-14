//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 13/02/23.
//

import Foundation

struct RMLocation: Codable{
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
