//
//  BuildBaseInfoModel.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/19.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import SwiftyJSON

class BuildBaseInfoModel: NSObject {
    var build_name: String?
    var build_address: String?
    var build_num: String?
    var room_num: String?
    var area_address: String?
    var detail_address: DetailAddressModel
    var area:[Any]?
    // 这里面积area中就不能再用arrayValue获取了，因为arrayValue获取的为JSON类型，我们需要转为我们需要的对象
    init(jsonData: JSON) {
        build_name    = jsonData["build_name"].stringValue
        build_address = jsonData["build_address"].stringValue
        area_address  = jsonData["area_address"].stringValue
        room_num      = jsonData["room_num"].stringValue
        build_num     = jsonData["build_num"].stringValue
        area          = jsonData["area"].arrayObject
        detail_address = DetailAddressModel(jsonData: jsonData["detail_address"])
    }

}

class DetailAddressModel: NSObject {
    var province: String?
    var city: String?
    var district: String?
    var street: String?
    
    init(jsonData: JSON) {
        province = jsonData["province"].stringValue
        city = jsonData["city"].stringValue
        district = jsonData["district"].stringValue
        street = jsonData["street"].stringValue
    }
    
}


//let baseInfo: [String : Any] = ["build_name":"置信·原墅",
//                                "build_address":"学院中路与金桥路交汇处东北侧",
//                                "area_address":"浙江省温州市鹿城区五马街道",
//                                "area":[89,"109","129"],
//                                "detail_address":["province":"浙江省",
//                                                  "city":"温州市",
//                                                  "district":"鹿城区",
//                                                  "street":"五马街道"],
//                                "build_num": 12,
//                                "room_num": 588]
