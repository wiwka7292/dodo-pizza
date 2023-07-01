//
//  DetailProductView.swift
//  HomeWorkDodoPizza
//
//  Created by Gor Zhenya on 19/03/2023.
//

import UIKit

class DetailScreenVC: UIViewController{
    
    
    var productArchiver = ProductsArchiverImpl()
    
    var currentProduct: Product?
    
    
    var detailView = DetailScreenView()
    
    var buttonHiddenView: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "arrow.down.circle"), for: .normal)
        button.addTarget(self, action: #selector(buttonHiddenTapped), for: .touchUpInside)
        return button
    }()
    var cartButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("В корзину", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        button.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [cartButton])
        stack.backgroundColor = .white.withAlphaComponent(0.9)
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 17, leading: 15, bottom: 10, trailing: 15)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupContraints()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailView.tableHeaderView.update(currentProduct!)
    }
    
    func setupViews(){
        
        view.addSubview(detailView)
        view.addSubview(stackView)
        view.addSubview(buttonHiddenView)
        
    }
    
    func setupContraints(){
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(view)
            make.left.right.equalTo(view)
        }
        detailView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaInsets)
        }
        
        buttonHiddenView.snp.makeConstraints { make in
            make.left.top.equalTo(view).inset(20)
        }
        
        
    }
    
    @objc func buttonHiddenTapped(){
        self.dismiss(animated: true)
    }
    
    @objc func cartButtonTapped(){
        
        updateProductsInCart()
        
        self.dismiss(animated: true)
    }
    
    
    func updateProductsInCart() {
        
        
        var productsInCart = productArchiver.retrieve()
        
        
        if productsInCart.isEmpty {
            productsInCart.append(currentProduct!)
            currentProduct?.count = 1
            productArchiver.save(productsInCart)
            return
        }
        
        for (index, element) in productsInCart.enumerated() {
            var count = element.count ?? 1
        
            if element.id == currentProduct?.id {
                count += 1
                element.count = count
                productArchiver.save(productsInCart)
                break
            }
            if index == productsInCart.count - 1 {
                productsInCart.append(currentProduct!)
                currentProduct?.count = 1
                productArchiver.save(productsInCart)
            }
        }


    }
    
    
    func deleteProductFromCart(currentValue: Int){
        var productInCart = productArchiver.retrieve()
        
        productInCart.remove(at: currentValue)
        productArchiver.save(productInCart)
    }
    
}



