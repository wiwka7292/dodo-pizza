//
//  TableFooterViews.swift
//  homeWorkMenu
//
//  Created by Жека on 11/03/2023.
//

import UIKit
import SnapKit


final class TableHeaderView: UIView {
    
    var buttonTypeDelivery = ButtonDouble()
    var collectionStories = CollectionStories()

    var collectionSales = CollectionSales()
    
    var labelView: UILabel = {
        var label = UILabel()
        label.text = "Выгодно и вкусно"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [buttonTypeDelivery, collectionStories])
        stack.axis = .vertical
        stack.spacing = 15
        stack.isLayoutMarginsRelativeArrangement = true
        stack.contentMode = .scaleAspectFit
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10)
        return stack
    }()
    
    lazy var stackView2: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [labelView, collectionSales])
        stack.axis = .vertical
        stack.spacing = -35
        stack.isLayoutMarginsRelativeArrangement = true
        stack.contentMode = .bottom
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
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
        
        addSubview(stackView)
        addSubview(stackView2)
        
    }
    
    func setupConstraints(){
        
        stackView.snp.makeConstraints { make in
            make.left.right.top.equalTo(self)
            make.bottom.equalTo(self).inset(200)
        }
        stackView2.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(self)
            make.top.equalTo(stackView.snp.bottom)
        }
        
    }
}
