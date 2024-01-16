//
//  MainTabBarController.swift
//  TestAppHammerSystems
//
//  Created by Akai on 12/1/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1).cgColor
        self.tabBar.tintColor = .systemPink
        print("MainTabBarController: viewDidLoad")
        generateTabBar()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: MenuViewController(),
                title: "Меню",
                image: UIImage(named: "menu")),
            generateVC(
                viewController: ContactsViewController(),
                title: "Контакты",
                image: UIImage(named: "contacts")),
            generateVC(
                viewController: ProfileViewController(),
                title: "Профиль",
                image: UIImage(named: "profile")),
            generateVC(
                viewController: BasketViewController(),
                title: "Корзина",
                image: UIImage(named: "basket"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
