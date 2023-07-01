//
//  IngrendCostructerCell.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import UIKit

struct items {
    var name: String
    var image: UIImage
}

let product: [items] = [
    items(name: "Сырный соус", image: UIImage(imageLiteralResourceName: "souce1")),
    items(name: "Кетчуп", image: UIImage(imageLiteralResourceName: "souce2")),
    items(name: "Чесночный соус", image: UIImage(imageLiteralResourceName: "souce3")),
    items(name: "Варенье", image: UIImage(imageLiteralResourceName: "souce4")),
    items(name: "Пепперони", image: UIImage(imageLiteralResourceName: "peperoni")),
    items(name: "Цыпленок", image: UIImage(imageLiteralResourceName: "kurica")),
    items(name: "Ветчина", image: UIImage(imageLiteralResourceName: "becon")),
    items(name: "Сыр блю чиз", image: UIImage(imageLiteralResourceName: "cheeseBlue")),
    items(name: "Красный лук", image: UIImage(imageLiteralResourceName: "luk")),
    items(name: "Томаты", image: UIImage(imageLiteralResourceName: "tomate")),
    items(name: "Чеддер и пармезан", image: UIImage(imageLiteralResourceName: "Chedder")),
]
