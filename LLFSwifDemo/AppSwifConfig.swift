//
//  AppSwifConfig.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/14.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import Foundation
import UIKit

#if DEBUG

var  DOMAIN_PATH        =        "http://114.55.232.19/caicai/api/v1/"

#else

var DOMAIN_PATH         =        "http://apiv2.wocaicai.com/caicai/api/v1/"

#endif

/* ****************************************************************************************************************** */

func LLLog<message>(message: message, file: NSString = #file, method: String = #function, line: Int = #line)
{
    #if DEBUG
    print("\(method) - [line:\(line)] - \(message)  \n")
    #endif
}

/* ****************************************************************************************************************** */

/// 屏幕宽
let KScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕高
let KScreenHeight = UIScreen.main.bounds.size.height

// 判断是否为iPhone X 系列 根据底部有没有安全距离 横屏34 竖屏21
var iPhoneXSeriess: Bool {
    if #available(iOS 11, *) {
        guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
            return false
        }
        if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
//            print(unwrapedWindow.safeAreaInsets.bottom)
            return true
        }
    }
    return false
}

/// 状态栏高度
let KStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
/// 底部tabBar高度
var KBottomBarHeight: CGFloat {
    return iPhoneXSeriess ? 83 : 49
}
/// 顶部导航栏高度
var KNavigationBarHeight: CGFloat {
    return iPhoneXSeriess ? 88 : 64
}
/// home indicator
var KIndicatorHeight: CGFloat {
    return iPhoneXSeriess ? 34 : 0
}

/* ****************************************************************************************************************** */


/*
 * 颜色
 */
let TINT_COLOR = UIColor(red: 164.0/255, green: 0.0/255, blue: 0.0/255, alpha: 1.0)
let TABBAR_TINT_COLOR = UIColor(red: 237.0/255, green: 31.0/255, blue: 59.0/255, alpha: 1.0)
let MAIN_WHITE_COLOR = UIColor(red: 242.0/255, green: 242.0/255, blue: 242.0/255, alpha: 1.0)
let LABEL_TEXT_COLOR = UIColor.gray
let INVEST_PERSON = UIColor(red: 34.0/255, green: 160.0/255, blue: 43.0/255, alpha: 1.0)
let INVEST_COM = UIColor(red: 237.0/255, green: 31.0/255, blue: 59.0/255, alpha: 1.0)
let INVEST_NEW = UIColor(red: 253.0/255, green: 143.0/255, blue: 27.0/255, alpha: 1.0)
let BTN_BACK_COLOR = UIColor(red: 18.0/255, green: 147.0/255, blue: 255.0/255, alpha: 1.0)
let LABEL_BLACK_COLOR = UIColor(red: 30.0/255, green: 30.0/255, blue: 30.0/255, alpha: 1.0)


