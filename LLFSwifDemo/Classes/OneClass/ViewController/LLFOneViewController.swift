//
//  LLFOneViewController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/13.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit



class LLFOneViewController: LLFBaseViewController,UITableViewDelegate,UITableViewDataSource {
    

    var titleArray = [String]()
    
    //MARK: - Lazy load
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: KNavigationBarHeight, width: KScreenWidth, height: KScreenHeight - KNavigationBarHeight - KBottomBarHeight), style: .plain)
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = UIColor.red
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "LLFOneViewTableViewCell", bundle: nil), forCellReuseIdentifier: "LLFOneViewTableViewCell")
        return tableView
    }()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor  = UIColor.white

        self.view.addSubview(self.tableView)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "LLFOneViewTableViewCell", for: indexPath) as! LLFOneViewTableViewCell
        
        cell.blLable.text = self.titleArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog(message: indexPath.row)
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
        self.titleArray = ["1","2","cell是直接用xib拖拽的，很方便有木有","创建内容数组","代理方法的实现","有2个代理方法是必须实现的","天行健君子以自强不息地势看君子以厚德载物","1","2","3","4","5"]
    }
    
    //MARK: - private methods


}
