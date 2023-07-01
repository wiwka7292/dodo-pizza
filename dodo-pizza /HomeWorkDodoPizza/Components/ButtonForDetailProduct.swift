//
//  ButtonForDetailProduct.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 19/03/2023.
//

import UIKit

final class ButtonForDetail: UIControl{
    
    lazy var buttonSize1: UIButton = {
        var button = UIButton()
        button.setTitle("Маленькая", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 3)
        button.addTarget(self, action: #selector(buttonFirst), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var buttonSize2: UIButton = {
        var button = UIButton()
        button.setTitle("Средняя", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 3)
        button.addTarget(self, action: #selector(buttonSecond), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    

    lazy var buttonSize3: UIButton = {
        var button = UIButton()
        button.setTitle("Большая", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 3)
        button.addTarget(self, action: #selector(buttonThird), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [buttonSize1, buttonSize2, buttonSize3 ])
        stack.axis = .horizontal
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .lightGray.withAlphaComponent(0.2)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        stack.contentMode = .scaleAspectFit
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    lazy var ButtonType1: UIButton = {
        var button = UIButton()
        button.setTitle("Традиционное", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 3)
        button.addTarget(self, action: #selector(buttonTypeFirst), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var ButtonType2: UIButton = {
        var button = UIButton()
        button.setTitle("Тонкое", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 3)
        button.addTarget(self, action: #selector(buttonTypeSecond), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var stackView2: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [ButtonType1, ButtonType2 ])
        stack.axis = .horizontal
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .lightGray.withAlphaComponent(0.2)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        stack.contentMode = .scaleAspectFit
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var stackViewMain: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [stackView, stackView2])
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 15)
        stack.spacing = 10
        stack.layer.cornerRadius = 15
        return stack
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        addSubview(stackViewMain)
    }
    
    func setupConstraints(){
        
        stackViewMain.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        
    }
    
    @objc func buttonFirst()
    {
        buttonSize1.backgroundColor = .white
        buttonSize2.backgroundColor = .none?.withAlphaComponent(0.1)
        buttonSize3.backgroundColor = .none?.withAlphaComponent(0.1)
    }
    
    @objc func buttonSecond()
    {
        buttonSize1.backgroundColor = .none?.withAlphaComponent(0.1)
        buttonSize2.backgroundColor = .white
        buttonSize3.backgroundColor = .none?.withAlphaComponent(0.1)
    }
    
    @objc func buttonThird()
    {
        buttonSize1.backgroundColor = .none?.withAlphaComponent(0.1)
        buttonSize2.backgroundColor = .none?.withAlphaComponent(0.1)
        buttonSize3.backgroundColor = .white
    }
    @objc func buttonTypeFirst()
    {
        ButtonType1.backgroundColor = .white
        ButtonType2.backgroundColor = .none?.withAlphaComponent(0.1)
    }
    
    @objc func buttonTypeSecond()
    {
        ButtonType1.backgroundColor = .none?.withAlphaComponent(0.1)
        ButtonType2.backgroundColor = .white
    }
}
