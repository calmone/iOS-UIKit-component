//
//  EffectProcessVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class EffectProcessVC: BaseViewController, UIWebViewDelegate {
    
    lazy var webview: UIWebView = {
        // Open the WebView.
        let wv = UIWebView()
        wv.delegate = self
        wv.frame = self.view.bounds
        
        return wv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add webview on view
        self.view.addSubview(webview)
        
        let url: URL! = URL(string: "https://medium.com/@calmone")
        let request: URLRequest = URLRequest(url: url)
        
        // Load started.
        webview.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // It will be called when all the Webs have finished loading.
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("webViewDidFinishLoad")
    }
    
    // It will be called when the Web starts to load.
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("webViewDidStartLoad")
    }

}
