//
//  Product.swift
//  HomeWorkDodoPizza
//
//  Created by Zheka on 20.03.2023.
//

import Foundation

/*
 Product
 
 ProductModel - NetWorking model
 
 ProductDB

 */

struct ProductResponse: Codable {
    let products: [Product]
}

class Product: Codable {
    var id: Int
    var name: String
    var description: String
    var size: String?
    var price: Int
    var count: Int?
    var image: String
}

//class Product {
//    var id: Int
//    var name: String
//    var description: String
//    var size: String?
//    var price: Int
//    var count: Int
//    var image: String
//
//    init(id: Int, name: String, description: String, size: String? = nil, price: Int, count: Int = 1, image: String) {
//        self.id = id
//        self.name = name
//        self.description = description
//        self.size = size
//        self.count = count
//        self.price = price
//        self.image = image
//    }
//}
