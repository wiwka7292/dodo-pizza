//
//  EmptryCart.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import UIKit


class EmptyCartView: UIControl {
    
    var imageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "emptyCart")
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.6 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.7 * width).isActive = true
        return image
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Ой, пусто!"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()
    
    var detailLabel: UILabel = {
        var label = UILabel()
        label.text = "Ваша корзина пуста, откройте <<Меню>> и выберите понравившийся товар."
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    var detailLabel2: UILabel = {
        var label = UILabel()
        label.text = "Мы доставим ваш заказ от 549Р"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    var buttonView: UIButton = {
        var button = UIButton()
        button.setTitle("Перейти в меню", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 100, bottom: 10, right: 100)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(CartVC().ButtonToMenu), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [imageView, titleLabel, detailLabel, detailLabel2, buttonView])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        stack.distribution = .fill
        stack.widthAnchor.constraint(equalToConstant: 350).isActive = true
        return stack
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
  
    
    func setupViews(){
        addSubview(stackView)
    }
    
    func setupConstraints(){
        
        stackView.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(self)
        }
    }
   
  
}
