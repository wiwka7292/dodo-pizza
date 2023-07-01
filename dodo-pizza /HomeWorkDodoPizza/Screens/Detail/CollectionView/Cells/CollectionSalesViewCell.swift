//
//  CollectionSalesView.swift
//  homeWorkMenu
//
//  Created by Жека on 11/03/2023.
//

import UIKit
import SnapKit


class CollectionSalesViewCell: UICollectionViewCell{
    
    static var reuseId = "Collection Sales"
    
    
    var label: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    var buttonPrice: UIButton = {
        var button = UIButton()
        button.backgroundColor = .orange.withAlphaComponent(0.2)
        button.layer.cornerRadius = 10
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.contentEdgeInsets = UIEdgeInsets(top: 1, left: 2, bottom: 1, right: 2)
        return button
    }()
    
    var image: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        return image
    }()
    
    lazy var stackViewHorizontal: UIStackView  = {
        var stack = UIStackView(arrangedSubviews: [image, stackViewVertical])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.contentMode = .scaleAspectFit
        stack.isLayoutMarginsRelativeArrangement = true
        
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stack
    }()
    
    lazy var stackViewVertical: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [label, buttonPrice])
        stack.axis = .vertical
        stack.spacing = 5
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
        
        contentView.addSubview(stackViewHorizontal)
        
    }
    
    func setupConstraints(){
        stackViewHorizontal.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
    }
    func update(_ sale: Sale){
        label.text = sale.title
        buttonPrice.setTitle("\(sale.price) p", for: .normal)
        image.image = UIImage(named: sale.image)
    }
}



