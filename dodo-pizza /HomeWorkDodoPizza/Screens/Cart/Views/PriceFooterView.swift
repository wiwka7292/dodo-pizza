//
//  PriceFooterView.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import UIKit


final class PriceFooterView: UIView{

   
    
    var coll = CartVC()
    lazy var collectionViewMain = coll.collectionViewMain.self
     var firstLabel = UILabel.FactSmallLabel("1")
    var secondLabel = UILabel.FactSmallLabel("Доставка")
     var priceLabel = UILabel.FactSmallLabel("666Р")
    var statusDeliveryLabel = UILabel.FactSmallLabel("Бесплатно")
    var coinLabel = UILabel.FactSmallLabel("Начислим додкоинов")
    var valueCointLabel = UILabel.FactSmallLabel("1")
    
    var textFieldView: UITextField = {
        var field = UITextField()
        field.attributedPlaceholder = NSAttributedString(
            string: "Ввести промокод",
            attributes: [NSAttributedString.Key.foregroundColor: UIColorFromRGB(rgbValue: 0xC84700)
                        ])
        field.textColor = .orange
        field.textAlignment = .center
        field.backgroundColor = UIColorFromRGB(rgbValue: 0xFFD2B9).withAlphaComponent(0.4)
        field.font = UIFont.boldSystemFont(ofSize: 15)
        field.layer.cornerRadius = 20
        let width = UIScreen.main.bounds.width
        field.heightAnchor.constraint(equalToConstant: 0.1 * width).isActive = true
        field.widthAnchor.constraint(equalToConstant: 0.65 * width).isActive = true
        return field
    }()
    
    lazy var stackVertical: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [firstLabel, coinLabel, secondLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        stack.distribution = .equalSpacing

        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 2, leading: 10, bottom: 0, trailing: 10)
        return stack
    }()
    
    lazy var stackVertical2: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [priceLabel, valueCointLabel, statusDeliveryLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .trailing
        stack.distribution = .equalCentering
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return stack
    }()
    
    lazy var stackHorizontal: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [stackVertical, stackVertical2])
        stack.axis = .horizontal
        stack.spacing = 150
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 10)
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return stack
    }()
    
    lazy var mainStackVertical: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [textFieldView, stackHorizontal])
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .center
        stack.backgroundColor = .white
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0)
        return stack
    }()
    
    lazy var stackView1: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelView, collectionViewMain])
        stack.axis = .vertical
        stack.spacing = 5
        stack.backgroundColor = .systemGray6
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 5, trailing: 10)
        return stack
    }()
    
    var labelView: UILabel = {
        var label = UILabel()
        label.text = "Добавить к заказу?"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var stackViewVeryMain: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [stackView1,mainStackVertical])
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    func createTextLabel(_ text: String) -> UILabel {
        let label = UILabel()

        label.text = text
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return label
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        
    }
    
    private func setupViews(){
        addSubview(stackViewVeryMain)
        
    }
    
    private func setupConstraints(){
        stackViewVeryMain.snp.makeConstraints { make in
            make.left.right.bottom.top.equalTo(self)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func update(_ count: Int, price: Int, coin: Int) {
        firstLabel.text = "\(count) товар"
        priceLabel.text = "\(price)"
        valueCointLabel.text = "+\(coin)"
    }
}

