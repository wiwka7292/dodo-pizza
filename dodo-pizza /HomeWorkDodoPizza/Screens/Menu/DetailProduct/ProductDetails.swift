//
//  ProductDetails.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 19/03/2023.
//

import UIKit
import SnapKit

class ProductDeatailView: UIView {
    
    
    var buttonView: UIButton = {
        var button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("В корзину", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 20
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupViews(){
        view.addSubview(buttonView)
    }
    
    func setupConstraints(){
        
        buttonView.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(100)
            make.left.right.equalTo(self).inset(20)
        }
        
    }
    
        
    
}
