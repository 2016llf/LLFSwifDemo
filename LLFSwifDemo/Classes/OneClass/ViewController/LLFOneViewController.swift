//
//  LLFOneViewController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/13.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit

func NSLog<T>(message: T, file: NSString = #file, method: String = #function, line: Int = #line)
{
    #if DEBUG
    print("\(method)[\(line)]: \(message)")
    #endif
}




class LLFOneViewController: LLFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor.white
        // Do any additional setup after loading the view.
    
        func returnOptionValue(value: Bool) -> String? { // 返回类型为可选String类型
            if value {
                return "返回类型是可选类型值" // 如果为真，返回Int类型的值1
            } else {
                return nil //返回nil
            }
        }
        
        let optionValue = returnOptionValue(value: true) // 要用可选绑定判断再使用，因为returnOptionValue为String？可选类型
        if let value = optionValue {
            print(value)
        } else {
            print("none value")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
