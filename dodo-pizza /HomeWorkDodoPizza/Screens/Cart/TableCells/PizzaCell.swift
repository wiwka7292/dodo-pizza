//
//  PizzaCellTableViewCell.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import UIKit

class PizzaCell: UITableViewCell {

    
    static var reuseId = "PizzaCell"
    lazy var stepperButton = StepperButton()
    
    
    lazy var stackMainHorizontal: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [stackHorizontal, stackHorizontal2])
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stack
    }()
    
    lazy var stackHorizontal2: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [priceLabel, stepperButton])
        stack.axis = .horizontal
        stack.spacing = 50
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        return stack
    }()
    lazy var stackVertical: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [nameLabel, detailLabel])
        stack.axis = .vertical
        stack.spacing = -40
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var stackHorizontal: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [pizzaImage, stackVertical])
        stack.axis = .horizontal
        stack.spacing = 15
        return stack
    }()
    var pizzaImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        return image
    }()
  
    var detailLabel: UILabel = {
        var label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    var nameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    var priceLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        contentView.addSubview(stackMainHorizontal)
        
    }
    
    func setupConstraints(){
        stackMainHorizontal.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(contentView)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func update( _ product: Product, index: Int) {
        nameLabel.text = product.name
        detailLabel.text = product.description
        priceLabel.text = "\(product.price) Р"
        pizzaImage.image = UIImage(named: "\(product.image)")
        
        stepperButton.currentValue = product.count ?? 0
        
        stepperButton.index = index
    }

}
