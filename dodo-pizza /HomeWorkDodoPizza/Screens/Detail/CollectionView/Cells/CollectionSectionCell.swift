
import UIKit
import SnapKit

class CollectionSectionCell: UICollectionViewCell {
    
    static let reuseId = "Collection Section"
    
    var buttonCategories: UIButton = {
        var button = UIButton()
        button.backgroundColor = .lightGray.withAlphaComponent(0.3)
        button.layer.cornerRadius = 15
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(.gray, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 1, left: 5, bottom: 1, right: 5)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [buttonCategories])
        stack.axis = .vertical
        stack.spacing = 0
        stack.isLayoutMarginsRelativeArrangement = true
        stack.contentMode = .scaleAspectFit
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 35, leading: 10, bottom: 35, trailing: 10)
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
    func update(_ category: Category){
        buttonCategories.setTitle("\(category.name)", for: .normal)
    }
}

