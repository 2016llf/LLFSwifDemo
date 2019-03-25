//
//  LLFgetPushModel.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/20.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import SwiftyJSON

class LLFgetPushModel: NSObject {
    var desc : String?
    var title : String?
    var url : String?
    
    init(jsonData: JSON) {
        desc = jsonData["desc"].stringValue
        title = jsonData["title"].stringValue
        url = jsonData["url"].stringValue
        
    }
}
