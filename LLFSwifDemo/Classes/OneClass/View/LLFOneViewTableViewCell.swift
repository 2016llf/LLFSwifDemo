//
//  LLFOneViewTableViewCell.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/18.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit

class LLFOneViewTableViewCell: UITableViewCell {

    //定义一个闭包，带有两个参数
    var bbchange :((_ title:String,_ coloer:UIColor)->Void)?


    @IBOutlet weak var blLable: UILabel!
    
    @IBAction func touchMyButton(_ sender: UIButton) {
        
        bbchange?("龙飞",UIColor.red)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func configCellWith(Model model:LLFgetPushModel){
        self.blLable.text = model.title
    }
    
}
