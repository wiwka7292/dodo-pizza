//
//  TableFooterViews.swift
//  homeWorkMenu
//
//  Created by Жека on 11/03/2023.
//

import UIKit
import SnapKit


class ProductCell: UITableViewCell {
    
    static let reuseId = "ProductCell"
    
    var onProductCellTapped: ((Product)->())?
    
    var product: Product?
    
    var buttonView: UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(productCellTapped), for: .touchUpInside)
        return button
    }()
    lazy var verticalStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [nameLabel, detailLabel, priceButton])
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 12, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    var detailLabel: UILabel = {
        var label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    var priceButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .orange.withAlphaComponent(0.1)
        button.layer.cornerRadius = 15
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        return button
    }()
    
    var productImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        imageView.heightAnchor.constraint(equalToConstant: 0.25 * width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 0.25 * width).isActive = true
        return imageView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(buttonView)

    }
    
    private func setupConstraints() {
        
        productImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(contentView).inset(10)
            make.left.equalTo(productImageView.snp.right).offset(10)
        }
        buttonView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    
    func update(_ product: Product ) {
        self.product = product
        nameLabel.text = product.name
        detailLabel.text = product.description
        priceButton.setTitle("\(product.price) р", for: .normal)
        productImageView.image = UIImage(named: product.image)
    }
    
    //MARK: - Actions
    @objc func productCellTapped(sender: UIButton) {
        onProductCellTapped?(product!)
    }
    
   
}



