//
//  ProductsArchiver.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 20/03/2023.
//

import UIKit



protocol ProductsArchiver {
    func save(_ products: [Product]) //сохраняем друзей
    func retrieve() -> [Product] //закдалываем их массивом
}

final class ProductsArchiverImpl: ProductsArchiver {
    
    private let encoder = JSONEncoder() //кодирует в бинарник
    private let decoder = JSONDecoder() //разкодирует
    
    private let key = "Products"
    
    //MARK: - Public methods
    func save(_ products: [Product]) { //метод сохранить
        
        //Array<Product> -> Data
        //массив кладем в бинарник и кодируем, бинарник кладем в UserDefaults
        do {
            let data = try encoder.encode(products)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    //retrieve - получить данные
    func retrieve() -> [Product] {  //метод получить
        
        //Data -> Array<Product>
        //вытаскиваем из UserDefaults бинарник
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            //раскодировали бинарник в массив друзей
            let array = try decoder.decode(Array<Product>.self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
}
