//
//  WebViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 1..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class WebViewVC: BaseViewController, UIWebViewDelegate {
    
    lazy var webView: UIWebView = {
        // Generate WebView.
        let webView = UIWebView()
        
        // Set Delegate to itself.
        webView.delegate = self
        
        // Set the size of WebView.
        webView.frame = self.view.bounds
        
        // Set the URL.
        let url: URL = URL(string: "https://medium.com/@calmone")!
        
        // Issue a rev.
        let request: NSURLRequest = NSURLRequest(url: url)
        
        // Issue the request.
        webView.loadRequest(request as URLRequest)
        
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UIWebView on view
        self.view.addSubview(self.webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called when all pages have been read.
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("webViewDidFinishLoad")
    }
    
    // Called when the Page starts loading.
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("webViewDidStartLoad")
    }

}
