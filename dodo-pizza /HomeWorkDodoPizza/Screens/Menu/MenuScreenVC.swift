//
//  ViewController.swift
//  homeWorkMenu
//
//  Created by Жека on 11/03/2023.
//

import UIKit

class MenuScreenVC: UIViewController {
    
    //var productService = MenuServiсe()
    var jsonLoader = JsonLoader()
    
    var productsAPI = ProductsAPI()
    var products: [Product] = []
    
    var menuView: MenuScreenView { self.view as! MenuScreenView }
    
    
    override func loadView() {
        view =  MenuScreenView.init(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.onEvent = { product in
            let controller = DetailScreenVC()
            controller.currentProduct = product
            self.present(controller, animated: true)
        }
        
        fetchProducts()
        
    }
    
    func fetchProducts() {
        //let products = productService.products
        //menuView.
        
        
        //let products = jsonLoader.loadProducts(filename: "menu") ?? []
        
//        productsAPI.fetchProducts { [weak self] result in
//            guard let self else { return }
//
//            switch result {
//            case .success(let products):
//                self.products = products
//
//                self.menuView.update(products: products)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        Task {
            do {
                let products = try await productsAPI.fetchProducts()
                menuView.update(products: products)
            } catch {
                print(error)
            }
        }
        
        
    }
    
    
}
//
//    @objc func productCellTapped(_ sender: UIButton) {
//
//


//    }

