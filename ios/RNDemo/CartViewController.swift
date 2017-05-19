//
//  CartViewController.swift
//  RNDemo
//
//  Created by xiaoP on 2017/5/19.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import UIKit
import React

class CartViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    fileprivate func configUI() {
        guard let view = RNModuleManager.shared.viewFor(name: "cart") else {
            return print("could not load cart from js-slide")
        }
        self.view = view
    }
    
}
