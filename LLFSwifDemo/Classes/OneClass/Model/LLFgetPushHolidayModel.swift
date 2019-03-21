//
//  LLFgetPushHolidayModel.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/20.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import SwiftyJSON

class LLFgetPushHolidayModel: NSObject {
    var datas: DatasModel
    var code = 0
    var msg = ""

    init(jsonData: JSON) {
        datas = DatasModel(jsonData: jsonData["datas"])
        code = jsonData["code"].intValue
        msg = jsonData["msg"].stringValue

    }
}



class DatasModel: NSObject {
    var data:[Any]?
    var count = 0

    init(jsonData: JSON) {
        data = jsonData["data"].arrayObject
        count = jsonData["count"].intValue

    }
}

//({
//    code = 200;
//    datas =     {
//        count = 3;
//        data =         (
//            {
//                desc = "";
//                title = "\U5e2e\U5566\U8dd1\U817f2019\U5e74\U6700\U65b0\U6536\U8d39\U6807\U51c6";
//                url = "https://m.paotui.com/app/json/holiday/id/14.html";
//        },
//            {
//                desc = "";
//                title = "\U5e2e\U624b\U63a5\U5355\U6743\U9650\U8c03\U6574";
//                url = "https://m.paotui.com/app/json/holiday/id/22.html";
//        },
//            {
//                desc = "";
//                title = "\U5173\U4e8e\U5f02\U5e38\U8ba2\U5355\U7684\U5224\U5b9a\U548c\U5904\U7f5a";
//                url = "https://m.paotui.com/app/json/holiday/id/26.html";
//        }
//        );
//    };
//    msg = "\U8c03\U7528\U6210\U529f";
//})


//{
//    code = 200;
//    datas =     {
//        list =         (
//        );
//        page = 0;
//        total = 0;
//    };
//    msg = "\U8bf7\U6c42\U6210\U529f";
//}
