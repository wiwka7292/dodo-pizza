//
//  TableProductView.swift
//  homeWorkMenu
//
//  Created by Жека on 12/03/2023.
//

import UIKit
import SnapKit

final class MenuScreenView: UIView {
    
    
    var onEvent: ((Product)->())?
    
    var products: [Product] = []
    
    var categoriesView = CategoriesView()
    
    lazy var tableHeaderView = TableHeaderView.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 450))
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        
        table.delegate = self
        table.dataSource = self
        table.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        table.tableHeaderView = tableHeaderView
        
        return table
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews(){
        self.addSubview(tableView)
    }
    
    private func setupConstraints(){
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaInsets)
            
        }
    }
    
    func update(products: [Product]) {
        self.products = products
        tableView.reloadData()
    }
    
}

extension MenuScreenView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.update(product)
        
        cell.onProductCellTapped = { product in
            self.onEvent?(product)
        }
        
        cell.selectionStyle = .none
        return cell
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return categoriesView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}
