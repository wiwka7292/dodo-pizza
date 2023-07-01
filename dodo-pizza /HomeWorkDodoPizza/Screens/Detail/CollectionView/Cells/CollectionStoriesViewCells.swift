//
//  CollectionStoriesView.swift
//  homeWorkMenu
//
//  Created by Жека on 11/03/2023.
//

import UIKit
import SnapKit

class CollectionStoriesCell: UICollectionViewCell {
    
    
    static let reuseId = "Collection Stories"
    
    var imageViewStories: UIImageView = {
        var image = UIImageView()
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.7 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.orange.cgColor
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [imageViewStories])
        stack.axis = .vertical
        stack.layer.borderColor = UIColor.orange.cgColor
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
    
    func setupViews(){
        
        contentView.addSubview(stackView)
        
    }
    
    func setupConstraints(){
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
    }
    func update(_ story: Story ) {
        imageViewStories.image = UIImage(named: story.image)
    }
}
