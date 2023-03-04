//
//  RMService.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 13/02/23.
//

import Foundation

final class RMService{
    static let shared = RMService()
    private init (){
        
    }
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<String, Error>) -> Void
    ){
        
    }
}
