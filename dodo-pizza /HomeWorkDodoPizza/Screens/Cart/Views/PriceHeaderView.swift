//
//  PriceHeaderView.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import UIKit

final class PriceHeaderView: UIView {
    
    lazy var priceLabelHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Товаров на сумму"
        return label
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
        addSubview(priceLabelHeader)
    }
    
    private func setupConstraints() {
        priceLabelHeader.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(self).inset(20)
        }
    }
    
    ///
    func update(_ count: Int, price: Int) {
        priceLabelHeader.text = "\(count) товара на сумму \(price)"
    }
}

