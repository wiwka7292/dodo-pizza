//
//  MainTabVC.swift
//  HomeWorkDodoPizza
//
//  Created by Жека on 01/03/2023.
//

import UIKit


final class MainTabVC: UITabBarController {
    
    
    private var menuVC: MenuScreenVC = {
        let controller = MenuScreenVC()
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard.fill")
        let tabItem = UITabBarItem.init(title: "Меню", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        return controller
    }()
  
    private var cartVC: CartVC = {
        let controller = CartVC()
        let image = UIImage(systemName: "cart")
        let selectedImage = UIImage(systemName: "cart.fill")
        let tabItem = UITabBarItem.init(title: "Корзина", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    
    }
    
    private func setup(){
        
        let menuNC = UINavigationController(rootViewController: menuVC)
        let cartNC = UINavigationController(rootViewController: cartVC)
        menuVC.title = "Меню"
        cartVC.title = "Корзина"
        viewControllers = [menuNC, cartNC]
        
        
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .gray
    }

    }
    


func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0))
}
