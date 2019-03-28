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
import MJRefresh
import MBProgressHUD

class LLFGetViewController: LLFBaseViewController, UITableViewDelegate, UITableViewDataSource {

    
    var dataArray = NSMutableArray()

    //MARK - Lazy Load
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight - KNavigationBarHeight - KIndicatorHeight), style: .plain)
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = UIColor.red
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "LLFOneViewTableViewCell", bundle: nil), forCellReuseIdentifier: "LLFOneViewTableViewCell")
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.requestData()
        })
        tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
            self.requestData()
        })
        return tableView
        
    }()

    // MARK - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "get请求"
        
        self.view.addSubview(self.tableView)
        
        self.tableView.mj_header.beginRefreshing()
        
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LLFOneViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LLFOneViewTableViewCell", for: indexPath) as! LLFOneViewTableViewCell

        let model = LLFgetPushModel.init(jsonData: JSON.init(self.dataArray[indexPath.row]))
        
        cell.configCellWith(Model: model)
    
        ///实现回调
        cell.bbchange = { (title:String,coloer:UIColor) in
            MBProgressHUD.showSuccess("成功")
        }

        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    
    // MARK：- requestData
    
    func requestData(){
        
        //        let parameters: Parameters = ["key":"s",
        //                                      "area_code":"441402",
        //                                      "type":"1"]
        //        let url = "https://m.paotui.com/app/CommonCoupon/setFirstCoupon"
        
        
        //        let url = "https://m.paotui.com/app/json/getPushHoliday?area_code=441402&type=1"
        
        
        let url = "https://m.paotui.com/app/json/getPushHoliday"
        let parameters: Parameters = ["area_code":"441402",
                                      "type":"1"]
//        LLLog(message: url)
//        LLLog(message: parameters)
//
//        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//
//            print(response.value as Any)
//
//            let model = LLFgetPushHolidayModel(jsonData: JSON(response.value as Any))
//
//            if(model.code == 200){
//
//                self.dataArray = model.datas.data!
//
//                LLLog(message: self.dataArray)
//
//                let modell = LLFgetPushModel(jsonData: JSON(self.dataArray[1]))
//
//                LLLog(message: modell.title)
//
//            }else{
//                LLLog(message: model.msg)
//            }
//        }
        
        
        
        ConnectManger.shareManager().requestData(.get, urlString: url, parameters: parameters, success: { (response) in
            
            let model = LLFgetPushHolidayModel(jsonData: JSON(response))

            if model.code == 200{
//                self.dataArray .removeAllObjects()
                
                self.dataArray.addObjects(from: model.datas.data!)
                
                self.tableView .reloadData()
        
            }
            
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()

        }) { (NSError) in

        }
    }
    
    

    

}
