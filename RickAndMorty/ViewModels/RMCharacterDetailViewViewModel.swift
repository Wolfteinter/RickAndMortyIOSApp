//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 21/05/23.
//

import Foundation

final class RMCharacterDetailsViewViewModel{
    private let character: RMCharacter
    init(character: RMCharacter){
        self.character = character
    }
    
    public var title: String{
        character.name.uppercased()
    }
}
