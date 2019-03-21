//
//  ConnectManger.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/20.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
    case put
    case delete
}

class ConnectManger: SessionManager {


    static var instance : ConnectManger? = nil
    
    class func shareManager() -> ConnectManger{
        
        var header : HTTPHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        header["Authorization"] = ""
        header.updateValue("application/json", forKey: "Accept")
        let configration = URLSessionConfiguration.default
        configration.httpAdditionalHeaders = header
        
        instance = ConnectManger(configuration: configration)
        
        return instance!
    }
    
    func requestData(_ type : MethodType, urlString : String, parameters : [String : Any]?, success : @escaping (_ responseObject : [String : AnyObject]) -> (), failure : @escaping (_ error : NSError) -> ()) -> (){
        let method : HTTPMethod
        
        switch type {
        case .get:
            method = .get
            break
        case .post:
            method = .post
            break
        case .put:
            method = .put
            break
        default:
            method = .get
        }
        
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String : AnyObject]{
                    success(value)
                }
            case .failure(let error):
                failure(error as NSError)
            }
        }
    }
}
