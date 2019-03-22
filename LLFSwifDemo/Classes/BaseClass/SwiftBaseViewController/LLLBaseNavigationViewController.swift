//
//  LLLBaseNavigationViewController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/21.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit

class LLLBaseNavigationViewController: UINavigationController {

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            //            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem().barButtonItemWith(Target: self, Action: #selector(pressBack), NormalImage: UIImage(named:"")!, HighLightedImage: UIImage(named:"")!)
        }
        
        super.pushViewController(viewController, animated: animated)
        
    }
    
    @objc func pressBack(){
        self.popViewController(animated: true)
    }
    
}
