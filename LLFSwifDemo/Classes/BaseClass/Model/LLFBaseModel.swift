//
//  LLFBaseModel.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/19.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import SwiftyJSON

///模型基础
class LLFBaseModel: NSObject {
    
    var code = 0
    var msg = ""
    
    init(jsonData: JSON) {
        code    = jsonData["code"].intValue
        msg = jsonData["msg"].stringValue
    }
}
