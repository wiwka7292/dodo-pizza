//
//  TableHeaderView.swift
//  HomeWorkDodoPizza
//
//  Created by Gor Zhenya on 19/03/2023.
//

import UIKit

final class DetailHeaderView: UIView{
    
    lazy var buttonForDetailng = ButtonForDetail()
    lazy var collectionDetailView = CollectionViewDetail()
    
    var imageView: UIImageView = {
        var image = UIImageView()
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.7 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.7 * width).isActive = true
        image.image = UIImage(named: "7")
        image.contentMode = .scaleAspectFit

        return image
    }()
    
    var titleView: UILabel = {
        var label = UILabel()
        label.text = "Деревенская с бужениной"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        return label
    }()
    
    var detailPizza: UILabel = {
        var label = UILabel()
        label.text = "Запеченная буженина из свинины,моцарелла,картофель из печи,маринованные огурчики,красный лук,чеснок,фирменный томатный соус,соус ранч"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    var labelAddIngrend: UILabel = {
        var label = UILabel()
        label.text = "Добавьте по вкусу"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        
        return label
    }()
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [imageView, titleView, detailPizza, buttonForDetailng, labelAddIngrend, collectionDetailView])
        stack.axis = .vertical
        stack.spacing = 10
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stack.isLayoutMarginsRelativeArrangement = true
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
    
    func update(_ product: Product){
        imageView.image = UIImage(named: product.image)
        titleView.text = product.name
        detailPizza.text = product.description
    }
   
    
    func setupViews(){
        addSubview(stackView)
    }
    
    func setupConstraints(){
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
