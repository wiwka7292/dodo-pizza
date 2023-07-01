//
//  TableFooterViews.swift
//  homeWorkMenu
//
//  Created by Жека on 11/03/2023.
//


import UIKit
import SnapKit

final class CollectionSales: UIView{
    
    var saleService = SaleService()
    var sales: [Sale] = []
    
    lazy var collectionViewSales: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemsCount: CGFloat = 1
        let padding: CGFloat = 10
        let paddingCount: CGFloat = itemsCount + 1
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        let paddingSize = paddingCount * padding
        let cellSize = (UIScreen.main.bounds.width - paddingSize) / itemsCount / 3
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: 5, bottom: padding, right: 5)
        layout.itemSize = CGSize(width: 200, height: 100)
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray5.withAlphaComponent(0.1)
        collectionView.register(CollectionSalesViewCell.self, forCellWithReuseIdentifier: CollectionSalesViewCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        sales = saleService.fetchProducts()
    }
    
    func setupViews(){
        self.addSubview(collectionViewSales)
    }
    
    func setupConstraints(){
        
        collectionViewSales.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.height.equalTo(125)
        }
    }
    
}

extension CollectionSales: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionSalesViewCell.reuseId, for: indexPath) as! CollectionSalesViewCell
        let sale = sales[indexPath.row]
        cell.update(sale)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 15
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowOffset = CGSize(width: 4, height: 4)
        cell.layer.shadowRadius = 5.0
        return cell
    }
}
