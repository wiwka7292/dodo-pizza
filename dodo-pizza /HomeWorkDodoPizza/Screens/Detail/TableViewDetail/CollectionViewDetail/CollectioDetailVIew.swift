//
//  CollectioDetailVIew.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 19/03/2023.
//

import UIKit

class CollectionViewDetail: UIView {
    
    lazy var collectionViewMain: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let padding: CGFloat = 20
        let itemsCountInRow: CGFloat = 3
        let cellWidth: CGFloat = UIScreen.main.bounds.width / itemsCountInRow - padding
        
        layout.itemSize = CGSize.init(width: 100, height: 130)
        layout.minimumLineSpacing = 6
//        layout.minimumInteritemSpacing = -9
        
        
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(IngrendCell.self, forCellWithReuseIdentifier: IngrendCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        return collectionView
        
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
        self.addSubview(collectionViewMain)
    }
    
    func setupConstraints(){
        collectionViewMain.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaInsets)
        }
        
    }
}

extension CollectionViewDetail: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
        //return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngrendCell.reuseId, for: indexPath) as! IngrendCell
        let product = product[indexPath.row]
        cell.update(product)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 40
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowOffset = CGSize(width: 6, height: 6)
        cell.layer.shadowRadius = 10.0
        return cell
        
    }
    
    
}
