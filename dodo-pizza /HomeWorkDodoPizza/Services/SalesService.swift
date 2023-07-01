//
//  SalesService.swift
//  homeWorkMenu
//
//  Created by Жека on 12/03/2023.
//

import Foundation

class Sale {
    var title: String
    var price: Int
    var image: String
    
    init( title: String, price: Int, image: String) {
        self.title = title
        self.price = price
        self.image = image
    }
}

class SaleService{
    var sales = [
        Sale(title: "Пепперони фреш", price: 229, image: "sale1"),
        Sale(title: "3 пиццы", price: 1099, image: "sale2"),
        Sale(title: "Додстер", price: 169, image: "sale3"),
        Sale(title: "Комбо от 559Р", price: 559, image: "sale4"),
        Sale(title: "Бруслетики", price: 205, image: "sale5"),
    ]
    
    func fetchProducts() -> [Sale] {
        
        return sales
    }
}
