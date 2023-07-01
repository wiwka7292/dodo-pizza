//
//  PizzaContructerCell.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import Foundation

class Order {
    var products: [Product]
    
    var totalPrice: Int {
        var result = 0
        for product in products {
            result += (product.count ?? 0) * product.price
        }
        return result
    }
    
    var count: Int {
        var result = 0
        for product in products {
            result += product.count ?? 0
        }
        return result
    }
    
    var coin: Int {
        var result = 0
        for _ in products {
            result = totalPrice / 20
        }
        return result
    }
   
    init(products: [Product]) {
        self.products = products
    }
}





//class OrderService {
//    var products = Order.init(products: [
//        
//        Product(id: 104, name: "Пепперони", description: "Тесто, Cыр, Перец", size: "Средняя 20 см, традиционное тесто", price: 700, image: "4"),
//        Product(id: 105, name: "Деревенская с Бужениной", description: "Тесто, Cыр, Буженина", size: "Средняя 30 см, традиционное тесто", price: 500, image: "5"),
//        Product(id: 106, name: "Пепперони", description: "Тесто, Cыр, Перец", size: "Средняя 20 см, традиционное тесто", price: 700, image: "6"),
//    ])
//}
