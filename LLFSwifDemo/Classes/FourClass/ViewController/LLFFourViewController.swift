
//
//  LLFFourViewController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/13.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import Alamofire

class LLFFourViewController: LLFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        btn.backgroundColor = UIColor.yellow
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("下一个页面", for: .normal)
        btn.addTarget(self, action: #selector(touchBtn(btn:)), for: .touchUpInside)
        
        self.view.addSubview(btn)
        
        
    }
    
    @objc func touchBtn(btn: UIButton){
        let vc = LLFWKWebViewController()
        vc.title = "我是一个网页"
        vc.url = "https://www.hao123.com"
        vc.webView.reload()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    @objc func YYYYYY(){
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
