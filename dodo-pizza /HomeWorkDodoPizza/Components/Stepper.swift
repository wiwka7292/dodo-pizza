//
//  Stepper.swift
//  homeworkDelegate
//
//  Created by Жека on 26/02/2023.
//

import UIKit
import SnapKit


protocol PricePanelViewDelegate: AnyObject {
    func cartButtonTapped(_ value: String)
}

final class StepperButton: UIControl{
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [decreaseButton, labelValue, increaseButton])
        stack.axis = .horizontal
        stack.backgroundColor = .systemGray5
        stack.spacing = 7
        stack.layer.cornerRadius = 15
        return stack
    }()
    
    lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var labelValue: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.text = "\(currentValue)"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: UIFont.Weight.regular)
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(self)
        }
    }
    
    var index: Int = 0
    var currentValue = 1 {
        didSet {
            currentValue = currentValue > 0 ? currentValue : 0
            labelValue.text = "\(currentValue)"
        }
    }
    
    //MARK: - Actions
    @objc func buttonAction(_ sender: UIButton) {
        switch sender {
        case decreaseButton:
            currentValue -= 1
        case increaseButton:
            currentValue += 1
        default:
            break
        }
            sendActions(for: .valueChanged)
    }
}

