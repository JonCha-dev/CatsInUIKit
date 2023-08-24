//
//  CatModel.swift
//  CatsInUIKit
//
//  Created by Jon Chang on 8/23/23.
//

import Foundation

struct Cat: Decodable, Identifiable {
    let id: String
    let breed: String
    let address: String
    let name: String
    let photo: String
}

struct Mock {
    static let mock = Cat(id:"1", breed:"Toyger", address: "3092 Judd Mews", name:"Allan Feeney IV", photo:"https://loremflickr.com/640/480/cats")
}
