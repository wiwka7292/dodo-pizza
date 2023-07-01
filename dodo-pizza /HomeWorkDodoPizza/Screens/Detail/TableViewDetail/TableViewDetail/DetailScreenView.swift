//
//  TableProductViewDetail.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 19/03/2023.
//

import UIKit


final class DetailScreenView: UIView{
    
  
    lazy var tableHeaderView = DetailHeaderView.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 1200))
    
    lazy var tableView: UITableView = {
        var table = UITableView()
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

    
    func setupViews(){
        
        self.addSubview(tableView)
        
    }
    
    func setupConstraints(){
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
   
}


