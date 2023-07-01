//
//  FactLabel.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import UIKit

extension UILabel {
    
    static func FactSmallLabel( _ text: String) -> UILabel{
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "\(text)"
        return label
    }
}


