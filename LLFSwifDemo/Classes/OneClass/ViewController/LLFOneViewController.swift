//
//  LLFOneViewController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/13.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import MJRefresh
import MBProgressHUD

class LLFOneViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var titleArray = [String]()
    
    //MARK: - Lazy load
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight - KNavigationBarHeight - KBottomBarHeight), style: .plain)
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = UIColor.red
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "LLFOneViewTableViewCell", bundle: nil), forCellReuseIdentifier: "LLFOneViewTableViewCell")
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            print("下拉刷新")
            tableView.mj_header.endRefreshing()
        })
        tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
            print("上拉刷新")
            tableView.mj_footer.endRefreshing()
        })
        return tableView
    }()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor  = UIColor.white

        self.view.addSubview(self.tableView)
        
        self.tableView.mj_header.beginRefreshing()
        
        self.requestData()
        
    }
    
    //MARK: - UITableViewDataSource
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell:LLFOneViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LLFOneViewTableViewCell", for: indexPath) as! LLFOneViewTableViewCell

        cell.blLable.text = self.titleArray[indexPath.row]
        
        ///实现回调
        cell.bbchange = { (title:String,coloer:UIColor) in
            MBProgressHUD.showSuccess("成功")
        }
        
        return cell
    }
    
    //MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.row == 0 {
            let vc = LLFGetViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.row == 1{
            let vc = LLFPostViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
    
    //MARK: - requestData
    
    func requestData(){
        self.titleArray = ["Alamofire - get请求","Alamofire - post请求","天行健君子以自强不息地势看君子以厚德载物"]

        
        
        
        ///模拟数据
        let baseInfo: [String : Any] = ["build_name":"世界客商中心",
                                        "build_address":"学院中路与金桥路交汇处东北侧",
                                        "build_num": 12,
                                        "room_num": 588,
                                        "area_address":"广东省梅州市梅江区学海路"]
        
        let model = LLFOneViewModel(jsonData: JSON(baseInfo))
        LLLog(message: model.area_address!)
        
        
        // 面积中89是Int， 109和129是String
        let baseInfoNext: [String : Any] = ["build_name":"置信·原墅",
                                        "build_address":"学院中路与金桥路交汇处东北侧",
                                        "area_address":"浙江省温州市鹿城区五马街道",
                                        "area":[89,"109","129"],
                                        "detail_address":["province":"浙江省",
                                                          "city":"温州市",
                                                          "district":"鹿城区",
                                                          "street":"五马街道"],
                                        "build_num": 12,
                                        "room_num": 588]
        
        
        let modelNext = BuildBaseInfoModel(jsonData: JSON(baseInfoNext))
        LLLog(message: modelNext.detail_address.city!)
        print(modelNext.detail_address.city!)
        
    }
    //MARK: - private methods



}
