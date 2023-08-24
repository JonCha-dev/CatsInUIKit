//
//  HomeViewModel.swift
//  CatsInUIKit
//
//  Created by Jon Chang on 8/23/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var data: [Cat] = [Cat]()
    
    let service = CatService()
    var cancellables = Set<AnyCancellable>()
    
    func getData() {
        service.fetchData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print(String(describing: err))
                }
            }, receiveValue: { [weak self] result in
                self?.data = result
            })
            .store(in: &cancellables)
    }
}
