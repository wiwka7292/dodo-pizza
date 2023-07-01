//
//  ViewController.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import UIKit
import SnapKit

class CartVC: UIViewController {
    
    var productsArchiver = ProductsArchiverImpl()
    
    
    lazy var priceFooterView = PriceFooterView.init(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 360))
    lazy var priceHeaderView = PriceHeaderView.init(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
    lazy var priceButtonView = PriceButtonView()
    
    lazy var order = Order.init(products: [])
    
    
    
    lazy var emptyCartView = EmptyCartView()
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.backgroundColor = .white
        table.delegate = self
        table.dataSource = self
        table.register(PizzaCell.self, forCellReuseIdentifier: PizzaCell.reuseId)
        table.tableHeaderView = priceHeaderView
        table.tableFooterView = priceFooterView
        return table
    }()
    
    lazy var collectionViewMain: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemsCount: CGFloat = 1
        let padding: CGFloat = 20
        let paddingCount: CGFloat = itemsCount + 1
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        let paddingSize = paddingCount * padding
        let cellSize = (UIScreen.main.bounds.width - paddingSize) / itemsCount / 3
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: 5, bottom: padding, right: 5)
        layout.itemSize = CGSize(width: cellSize, height: 145)
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray5.withAlphaComponent(0.1)
        collectionView.register(IngrendCell.self, forCellWithReuseIdentifier: IngrendCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emptyCartView.isHidden = true
        setupViews()
        setupConstraints()
        update()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(productsArchiver.retrieve())
        
        order = Order(products: productsArchiver.retrieve())
        update()
    }
    
    private func update(){
        priceHeaderView.update(order.count, price: order.totalPrice)
        priceButtonView.update(order.totalPrice)
        priceFooterView.update(order.count, price: order.totalPrice, coin: order.coin)
        
        if order.totalPrice == 0{
            tableView.isHidden = true
            priceButtonView.isHidden = true
            emptyCartView.isHidden = false
        }else{
            tableView.isHidden = false
            priceButtonView.isHidden = false
            emptyCartView.isHidden = true
        }

        tableView.reloadData()
    }
    
    @objc func ButtonToMenu(){
        tabBarController?.selectedIndex = 0
    }
    
    
}

extension CartVC {
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(emptyCartView)
        view.addSubview(tableView)
        view.addSubview(priceButtonView)
    }
    
    func setupConstraints(){
        
        tableView.snp.makeConstraints { make in
            make.left.right.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(priceButtonView.snp.top)
        }
        
        priceButtonView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
        }
        emptyCartView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        
    }
}
extension CartVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PizzaCell.reuseId, for: indexPath) as! PizzaCell
        let product = order.products[indexPath.row]
        cell.update(product, index: indexPath.row)
        cell.stepperButton.addTarget(self, action: #selector(productCountChanged(counter: )), for: .valueChanged)
        cell.selectionStyle = .none
        
        return cell
    }
    @objc func productCountChanged(counter: StepperButton) {
        
        order.products[counter.index].count = counter.currentValue
        var productsInCart = productsArchiver.retrieve()
        
        for item in productsInCart{
            item.count = order.products[counter.index].count
            productsArchiver.save(productsInCart)
        }
        
        if counter.currentValue == 0 {
            order.products.remove(at: counter.index)
            DetailScreenVC().deleteProductFromCart(currentValue: counter.currentValue)
            
           
        }
        update()
    }
}


extension CartVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngrendCell.reuseId, for: indexPath) as! IngrendCell
        let product = product[indexPath.row]
        cell.update(product)
        cell.backgroundColor = .white.withAlphaComponent(0)
        return cell
        
    }
    
}

