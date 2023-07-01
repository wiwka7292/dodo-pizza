//
//  IngrendCell.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import UIKit
import SnapKit

class IngrendCell: UICollectionViewCell {
    
    static let reuseId = "IngrendCell"
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [imageView, labelView, labelPrice])
        stack.axis = .vertical
        stack.alignment = .center
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15)
        stack.distribution = .fill
        stack.isLayoutMarginsRelativeArrangement = true
        stack.spacing = 7
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 10
        return stack
    }()
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var labelView: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    var labelPrice: UIButton = {
        var buttonPrice = UIButton()
        buttonPrice.setTitle("79Р", for: .normal)
        buttonPrice.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 14)
        buttonPrice.layer.cornerRadius = 10
        buttonPrice.setTitleColor(UIColorFromRGB(rgbValue: 0xC84700), for: .normal)
        buttonPrice.backgroundColor = UIColorFromRGB(rgbValue: 0xFFD2B9).withAlphaComponent(0.7)
        buttonPrice.contentEdgeInsets = UIEdgeInsets(top: 3, left: 16, bottom: 3, right: 16)
        return buttonPrice
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(stackView)
        
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalTo(contentView)
            
            
        }
        
    }
    func update(_ product: items) {
        labelView.text = product.name
        imageView.image = product.image
        
    }
}


