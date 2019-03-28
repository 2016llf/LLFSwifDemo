//
//  MBProgressHud+Category.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/28.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import Foundation
import MBProgressHUD

extension MBProgressHUD {
    fileprivate class func showText(text: String, icon: String) {
        let view = viewWithShow()
        
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = text
//        let img = UIImage(named: "MBProgressHUD.bundle/\(icon)")
        let img = UIImage(named: icon)

        hud.customView = UIImageView(image: img)
        hud.mode = MBProgressHUDMode.customView
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 1)
    }
    
    class func viewWithShow() -> UIView {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindow.Level.normal {
            let windowArray = UIApplication.shared.windows
            
            for tempWin in windowArray {
                if tempWin.windowLevel == UIWindow.Level.normal {
                    window = tempWin;
                    break
                }
            }
            
        }
        return window!
    }
    
    class func showStatusInfo(_ info: String) {
        let view = viewWithShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = info
    }
    
    class func dismiss() {
        let view = viewWithShow()
        MBProgressHUD.hide(for: view, animated: true)
        
    }
    
    class func showSuccess(_ status: String) {
        showText(text: status, icon: "bs_red")
    }
    
    class func showError(_ status: String) {
        showText(text: status, icon: "bs_red")
    }
}


//MBProgressHUD.showSuccess("成功")
//MBProgressHUD.showError("错误")
//MBProgressHUD.showStatusInfo("")
//MBProgressHUD.dismiss()
