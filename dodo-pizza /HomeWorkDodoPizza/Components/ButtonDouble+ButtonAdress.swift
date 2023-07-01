//
//  DoubleButton.swift
//  homeWorkMenu
//
//  Created by Жека on 11/03/2023.
//

import UIKit
import SnapKit

final class ButtonDouble: UIControl{
    
    lazy var buttonDelivary: UIButton = {
        var button = UIButton()
        button.setTitle("На доставку", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 45, bottom: 5, right: 45)
        button.addTarget(self, action: #selector(buttonClickedDelivery), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var buttonOnTheSpot: UIButton = {
        var button = UIButton()
        button.setTitle("В зале", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 3)
        button.addTarget(self, action: #selector(buttonClickedSpot), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var buttonAdress: UIButton = {
        var button = UIButton()
        button.setTitle("Указать адрес доставки >", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.orange, for: .normal)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [buttonDelivary, buttonOnTheSpot ])
        stack.axis = .horizontal
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .systemGray4
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        //        stack.alignment = .firstBaseline
        return stack
    }()
    
    lazy var stackViewMain: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [stackView, buttonAdress])
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10)
        stack.spacing = 10
        stack.layer.cornerRadius = 15
        stack.backgroundColor = .lightGray.withAlphaComponent(0.2)
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
    
    @objc func buttonClickedDelivery()
    {
        buttonDelivary.backgroundColor = .lightGray
        buttonOnTheSpot.backgroundColor = .white.withAlphaComponent(0.1)
    }
    @objc func buttonClickedSpot()
    {
        buttonOnTheSpot.backgroundColor = .lightGray
        buttonDelivary.backgroundColor = .white.withAlphaComponent(0.1)
    }
}
