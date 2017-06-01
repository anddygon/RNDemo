//
//  EventDispatcher.swift
//  RNDemo
//
//  Created by xiaoP on 2017/5/25.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import Foundation
import React

// MARK: 继承自RCTEventEmitter
@objc(JSEventEmitter)
class JSEventEmitter: RCTEventEmitter {
    
    //定义内部枚举 因为枚举只会在这个文件和js端用到，所以定义为内部
    fileprivate enum EventName: String {
        case uploadProgress
        case XXX
        
        func toNotificationName() -> Notification.Name {
            return Notification.Name(rawValue: rawValue)
        }
        
        static var all: [String] {
            let arr: [EventName] = [.uploadProgress, .XXX]
            return arr.map{ $0.rawValue }
        }
    }
    //必须重载  要暴露给js的方法名
    override func supportedEvents() -> [String]! {
        return EventName.all
    }
    
    ///这里的bridge是react会自动设置的
    override var bridge: RCTBridge! {
        didSet{
            NotificationCenter.default
                .addObserver(self,
                             selector: #selector(JSEventEmitter.handle(notification:)),
                             name: EventName.uploadProgress.toNotificationName(),
                             object: nil)
        }
    }
    // 这里真正的发送native事件给js
    @objc fileprivate func handle(notification: Notification) {
        let eventName = notification.name.rawValue
        let params = notification.userInfo
        sendEvent(withName: eventName,
                  body: params)
    }
    /*
     //供原生外部调用  外部调用的时候回忆notification形势发送出去  而这个实例在ract创建的时候也被创建了 而且在该实例被创建的时候订阅了这notification 然后收到后又会调用handle真正的发送出去
     这里之所以要走这么麻烦的推送流程主要是因为我们不能手动创建这个JSEventEmitter实例，必须由react创建才能成功发送事件
     然后又不想把各种逻辑写在这个工具管理类里，采用notification的方式来解决
     */
    class func sendToJS(progress: Int) {
        NotificationCenter.default
            .post(name: NSNotification.Name.init(rawValue: EventName.uploadProgress.rawValue),
                  object: self,
                  userInfo: nil)
    }
    
    deinit {
        NotificationCenter.default
            .removeObserver(self, name: EventName.uploadProgress.toNotificationName(), object: nil)
    }
    
}

