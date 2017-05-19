//
//  TabBarController.swift
//  RNDemo
//
//  Created by xiaoP on 2017/5/19.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configViewControllers()
    }

    fileprivate func configViewControllers() {
        let titles = ["Home", "Designers", "Category", "Cart", "Me"]
        let viewControllers = titles.map { (title: String) -> UIViewController in
            let viewController: UIViewController
            switch title {
            case "Home":
                viewController = HomeViewController()
            case "Designers":
                viewController = DesignerViewController()
            case "Category":
                viewController = CategoryViewController()
            case "Cart":
                viewController = CartViewController()
            case "Me":
                viewController = MeViewController()
            default:
                fatalError("没有对应\(title)的view controller")
            }
            let navigationController = NavigationController(rootViewController: viewController)
            let item = UITabBarItem(title: title, image: nil, selectedImage: nil)
            
            item.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black,
                                         NSStrokeWidthAttributeName: 12,
                                         NSStrokeColorAttributeName: UIColor.purple,
                                         NSFontAttributeName: UIFont.systemFont(ofSize: 12)],
                                        for: .normal)
            item.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange,
                                         NSStrokeWidthAttributeName: 12,
                                         NSStrokeColorAttributeName: UIColor.purple,
                                         NSFontAttributeName: UIFont.systemFont(ofSize: 12)],
                                        for: .selected)
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
            navigationController.tabBarItem = item
            return navigationController
        }
        self.viewControllers = viewControllers
    }
    
}
