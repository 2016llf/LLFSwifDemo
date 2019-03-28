//
//  LLLWKWebViewController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/21.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit
import WebKit
import MBProgressHUD

class LLLWKWebViewController: LLFBaseViewController, WKNavigationDelegate {
    
    var urlStr = ""
    
    //MARK: - Lazy load
    
    lazy var webView: WKWebView = {
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight - KNavigationBarHeight - KIndicatorHeight), configuration: WKWebViewConfiguration())
        webView.navigationDelegate = self
        let myURL = URL(string:self.urlStr)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        return webView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view .addSubview(self.webView)
        
    }
    
    //MARK: - WKNavigationDelegate
    
    // 页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        LLLog(message: "页面开始加载时调用")
        MBProgressHUD.showStatusInfo("")
    }
    
    // 当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        LLLog(message: "当内容开始返回时调用")
        
    }
    
    // 页面加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        LLLog(message: "页面加载完成之后调用")
        MBProgressHUD.dismiss()
    }
    
    // 页面加载失败时调用
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        LLLog(message: "页面加载失败时调用")
        MBProgressHUD.showError("")

    }
}
