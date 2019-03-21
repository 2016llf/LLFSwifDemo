//
//  LLFGetViewController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/20.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LLFGetViewController: LLFBaseViewController {

    
    var dataArray = [Any]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.requestData()
        
    }
    
    // MARK：- requestData
    
    func requestData(){
        //        let url = "https://m.paotui.com/app/json/getPushHoliday?area_code=441402&type=1"
        
        //        let parameters: Parameters = ["key":"s",
        //                                      "area_code":"441402",
        //                                      "type":"1"]
        //        let url = "https://m.paotui.com/app/CommonCoupon/setFirstCoupon"
        
        
        let url = "https://m.paotui.com/app/json/getPushHoliday"
        let parameters: Parameters = ["area_code":"441402",
                                      "type":"1"]
        LLLog(message: url)
        LLLog(message: parameters)
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            print(response.value as Any)
            
            let model = LLFgetPushHolidayModel(jsonData: JSON(response.value as Any))
            
            if(model.code == 200){
                
                self.dataArray = model.datas.data!
                
                LLLog(message: self.dataArray)
                
                let modell = LLFgetPushModel(jsonData: JSON(self.dataArray[1]))
    
                LLLog(message: modell.title)
                
            }else{
                LLLog(message: model.msg)
            }
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
