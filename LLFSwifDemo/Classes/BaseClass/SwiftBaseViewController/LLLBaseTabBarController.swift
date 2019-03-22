//
//  LLLBaseTabBarController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/21.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit

class LLLBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tabBar.tintColor = UIColor.orange //tabbar 字体颜色
        tabBar.barTintColor = UIColor.yellow //tabbar 背景颜色
        
        self.addChildVC(childVC: LLFOneViewController(), childTitle: "First", imageName: "bs_hui", selectedImageName: "bs_red")
        self.addChildVC(childVC: LLFTwoViewController(), childTitle: "Second", imageName: "bs_hui", selectedImageName: "bs_red")
        self.addChildVC(childVC: LLFThreeViewController(), childTitle: "Third", imageName: "bs_hui", selectedImageName: "bs_red")
        self.addChildVC(childVC: LLFFourViewController(), childTitle: "Fourth", imageName: "bs_hui", selectedImageName: "bs_red")
        
    }
    
    
    /// 添加子控制器
    private func addChildVC(childVC: UIViewController, childTitle: String, imageName: String, selectedImageName:String)
    {
        let navigation = LLLBaseNavigationViewController(rootViewController: childVC)
        navigation.navigationBar.tintColor = UIColor.white //item 字体颜色
        navigation.navigationBar.barTintColor = UIColor.yellow //背景颜色
        //标题颜色
        childVC.title = childTitle
        childVC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        self.addChild(navigation)
    }
    
}
