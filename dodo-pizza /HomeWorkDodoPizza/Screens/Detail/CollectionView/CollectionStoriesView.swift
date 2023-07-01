//
//  CollectionSale.swift
//  homeWorkMenu
//
//  Created by Жека on 11/03/2023.
//

import UIKit
import SnapKit


final class CollectionStories: UIView{
    
    var storyService = StoriesServiсe()
    var stories: [Story] = []
    
    lazy var collectionViewStories: UICollectionView = {
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
        layout.itemSize = CGSize(width: 90, height: 110)
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray5.withAlphaComponent(0.1)
        collectionView.register(CollectionStoriesCell.self, forCellWithReuseIdentifier: CollectionStoriesCell.reuseId)
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
        
        stories = storyService.fetchProducts()
    }
    
    func setupViews(){
        self.addSubview(collectionViewStories)
    }
    
    func setupConstraints(){
        
        collectionViewStories.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }

    
}

extension CollectionStories: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionStoriesCell.reuseId, for: indexPath) as! CollectionStoriesCell
        let story = stories[indexPath.row]
        cell.update(story)
        return cell
    }
    
    
    
}
