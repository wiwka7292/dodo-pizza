//
//  PriceButtonView.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import UIKit

final class PriceButtonView: UIView {
    
    lazy var orderButton: UIButton = {
        var button = UIButton()
        
        button.setTitle("Оформить заказ на \(0) ₽", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.backgroundColor = .orange
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(orderButton)
    }
    
    private func setupConstraints() {
        orderButton.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(self).inset(20)
        }
    }
    
    ///Передача цены в orderButton
    func update(_ price: Int) {
        orderButton.setTitle("Оформить заказ на \(price) ₽", for: .normal)
    }
}

