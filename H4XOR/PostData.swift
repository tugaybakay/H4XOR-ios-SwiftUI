//
//  PostData.swift
//  H4XOR
//
//  Created by MacOS on 14.08.2023.
//

import Foundation

struct Result: Decodable{
    let hits : [Post]
}

struct Post: Decodable,Identifiable{
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
