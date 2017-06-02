//
//  RNModuleManager.swift
//  RNDemo
//
//  Created by xiaoP on 2017/5/19.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import Foundation
import React

class RNModuleManager: NSObject, RCTBridgeDelegate {
    
    static let shared = RNModuleManager()
    fileprivate(set) lazy var bridge: RCTBridge = {
      return RCTBridge(delegate: self, launchOptions: nil)
    }()
    
    
    func viewFor(name: String, initialProperties: [AnyHashable: Any]? = nil) -> RCTRootView? {
        let view = RCTRootView(bridge: bridge, moduleName: name, initialProperties: initialProperties)
        return view
    }
    
}

extension RNModuleManager {
    
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
    }
    
}
