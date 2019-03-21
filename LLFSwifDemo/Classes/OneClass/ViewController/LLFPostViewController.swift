
//
//  LLFPostViewController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/20.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import Alamofire

class LLFPostViewController: LLFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = "https://m.paotui.com/app/json/getPushHoliday"
        let parameters: Parameters = ["area_code":"441402",
                                      "type":"1"]
        
//        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//
//            if(response.error == nil){
//                print("请求成功")
//                print(response.value as Any)
//            }else{
//                print("请求失败\(String(describing: response.error))")
//            }
//
//            }
  
        ConnectManger.shareManager().requestData(MethodType.get, urlString: url, parameters: parameters, success: { (response) in
            print(response.values as Any)
        }) { (NSError) in
            print("出错咯")
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
