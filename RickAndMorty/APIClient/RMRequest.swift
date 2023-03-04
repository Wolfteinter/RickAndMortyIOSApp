//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 13/02/23.
//

import Foundation

final class RMRequest{
    private struct Constants{
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    private let pathComponents: Set<String>
    private let queryParameters: [URLQueryItem]
    
    private var urlSTring: String{
        var string  = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            print(argumentString)
            string += argumentString
        }
        return string
    }
    
    public var url: URL?{
        return URL(string: urlSTring)
    }
    
    public let httpMethod: String = "GET"
    
    
    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ){
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
