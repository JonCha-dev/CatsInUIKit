//
//  CatService.swift
//  CatsInUIKit
//
//  Created by Jon Chang on 8/23/23.
//

import Foundation
import Combine

enum APIError: LocalizedError {
    case urlError(String)
}

class CatService {
    let urlString = "https://647e1a94af984710854af0ac.mockapi.io/api/v1/Cats"
    
    func fetchData() -> AnyPublisher<[Cat], Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: APIError.urlError("URL error"))
                .eraseToAnyPublisher()
        }
    
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [Cat].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
