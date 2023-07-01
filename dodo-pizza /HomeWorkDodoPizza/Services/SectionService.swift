//
//  SectionService.swift
//  homeWorkMenu
//
//  Created by Жека on 12/03/2023.
//

import Foundation

class Category {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class CategoriesService{
    var categories = [
        Category(name: "Пицца"),
        Category(name: "Комбо"),
        Category(name: "Закуски"),
        Category(name: "Коктейли"),
        Category(name: "Кофе"),
        Category(name: "Десерты"),
        Category(name: "Напитки"),
        Category(name: "Соусы"),
        Category(name: "Другие товары"),
        
        
    ]
    
    func fetchProducts() -> [Category] {
        
        return categories
    }
}
