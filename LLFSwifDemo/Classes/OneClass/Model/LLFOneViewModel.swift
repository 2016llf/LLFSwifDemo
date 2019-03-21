//
//  LLFOneViewModel.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/19.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import SwiftyJSON

class LLFOneViewModel: NSObject {
    var build_name = ""
    var build_address = ""
    var build_num = ""
    var room_num = ""
    var area_address = ""
    
    init(jsonData: JSON) {
        build_name    = jsonData["build_name"].stringValue
        build_address = jsonData["build_address"].stringValue
        room_num      = jsonData["room_num"].stringValue
        build_num     = jsonData["build_num"].stringValue
        area_address  = jsonData["area_address"].stringValue
    }

}

//let baseInfo: [String : Any] = ["build_name":"世界客商中心",
//                                "build_address":"学院中路与金桥路交汇处东北侧",
//                                "build_num": 12,
//                                "room_num": 588,
//                                "area_address":"广东省梅州市梅江区学海路"]
