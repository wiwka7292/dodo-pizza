//
//  CollectionSection.swift
//  homeWorkMenu
//
//  Created by Жека on 11/03/2023.
//

import UIKit
import SnapKit


final class CategoriesView: UIView {
    
    
    var categoryService = CategoriesService()
    var categories: [Category] = []
    
    lazy var collectionViewSection: UICollectionView = {
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
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray5.withAlphaComponent(0.1)
        collectionView.register(CollectionSectionCell.self, forCellWithReuseIdentifier: CollectionSectionCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        categories = categoryService.fetchProducts()
    }
    
    func setupViews(){
        self.addSubview(collectionViewSection)
    }
    
    func setupConstraints(){
        
        collectionViewSection.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
 
}

extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionSectionCell.reuseId, for: indexPath) as! CollectionSectionCell
        let category = categories[indexPath.row]
        cell.update(category)
        return cell
    }
    
}

