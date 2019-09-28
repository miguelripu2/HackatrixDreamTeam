//
//  TabBarViewController.swift
//  A-marte
//
//  Created by Miguel Valcarcel on 9/28/19.
//  Copyright © 2019 Miguel Valcarcel. All rights reserved.
//

import UIKit

enum TabItemType: Int {
    case home
    
    var tabBarItem: UITabBarItem {
        var activeImage = String()
        var inactiveImage = String()
        switch self {
        case .home:
            activeImage = "PanicoNaranja"
            inactiveImage = "PanicoNegro"
        }
        return UITabBarItem(title: nil, image: UIImage(named: activeImage), selectedImage: UIImage(named: inactiveImage))
    }
}

class TabBarViewController: UITabBarController {
    
    private let tabBarItemsPosition: UIEdgeInsets = {
        return UIScreen.main.isSafeAreaActive() ? UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0) : UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = setupTabBarItemViewController(with: .home, viewController: HomeViewController())
        let secondViewController = setupTabBarItemViewController(with: .home, viewController: HomeViewController())
        viewControllers = [homeViewController, secondViewController]
        tabBar.backgroundColor = .white
        delegate = self
        tabBar.tintColor = UIColor(red: 220/255, green: 87/255, blue: 39/255, alpha: 1)
    }
    
    func setupTabBarItemViewController(with tabBarItem: TabItemType, viewController: UIViewController) -> UIViewController {
        let item = tabBarItem.tabBarItem
        item.tag = tabBarItem.rawValue
        viewController.tabBarItem = item
        viewController.tabBarItem.imageInsets = UIScreen.main.isSafeAreaActive() ? UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0) : UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        return viewController
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        return true
    }
}

extension UIScreen {
    func isSafeAreaActive() -> Bool {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows[0].safeAreaInsets.bottom > 0
        }
        return false
    }
}
