//
//  LLLBaseViewController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/21.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit

class LLLBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.isTranslucent = true
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("------------------------------\(type(of: self)) viewWillAppear")
        
    }
    
    
    deinit {
        
        print("------------------------------\(type(of: self)) Dealloc")
        
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
