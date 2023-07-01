//
//  JsonLoader.swift
//  TMS-dodo-pizza-project
//
//  Created by Жека on 16.03.2023.
//

import Foundation

//Класс-сервис - бизнес-логика - архивируем массив продуктов

//Набор методов

final class JsonLoader {

    //Файл menu.json который лежит в песочнице > [ProductModel]
    func loadProducts(filename: String) -> [Product]? {
        
        //Получаем путь файла из песочницы
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)//выгружаем контент из файла JSON по пути url в некую бинарный тип данных
                
                // декодируем(пассинг,maping) бинарный JSON модель данных
                let jsonData = try JSONDecoder().decode(ProductResponse.self, from: data)
                return jsonData.products
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
