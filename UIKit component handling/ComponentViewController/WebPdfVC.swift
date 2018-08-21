//
//  WebPdfVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 21..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class WebPdfVC: BaseViewController {
    
    // Generate button
    lazy var button: UIButton = {
        let b: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        b.layer.cornerRadius = 20.0
        b.layer.masksToBounds = true
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 50)
        b.backgroundColor = UIColor.orange
        b.setTitle("Open PDF", for: UIControlState.normal)
        b.setTitleColor(UIColor.white, for: UIControlState.normal)
        b.addTarget(self, action: #selector(onClickButton(_:)), for: UIControlEvents.touchUpInside)
        
        return b
    }()
    
    lazy var webView: UIWebView = {
        let wv = UIWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        wv.delegate = self
        wv.scalesPageToFit = true
        wv.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        
        return wv
    }()
    
    lazy var indicator: UIActivityIndicatorView = {
        let iv = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        iv.center = self.view.center
        iv.hidesWhenStopped = true
        iv.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        return iv
    }()
    
    var PDFurl: URL!
    var request: URLRequest!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add button on view
        self.view.addSubview(button)
        
        PDFurl = URL(string: "https://developer.apple.com/programs/terms/apple_developer_agreement.pdf")
        request = URLRequest(url: PDFurl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension WebPdfVC: UIWebViewDelegate {
    // Animation of the indicator is started.
    func startAnimation() {
        
        // Display NetworkActivityIndicator.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        // Display UIACtivityIndicator.
        if !indicator.isAnimating {
            indicator.startAnimating()
        }

        // Add an indicator to view.
        self.view.addSubview(indicator)
    }
    
    // Animation of the indicator is finished.
    func stopAnimation() {
        // Hide NetworkActivityIndicator.
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        // Hide UIACtivityIndicator.
        if indicator.isAnimating {
            indicator.stopAnimating()
        }
    }
    
    // A method called when the Button is pressed.
    @objc private func onClickButton(_ sender: UIButton) {
        // Start loading WebView.
        webView.loadRequest(request)
        
        // Add WebView to view.
        self.view.addSubview(webView)
    }
    
    // A method called when WebView's load is started.
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("load started")
        startAnimation()
    }
    
    // A method called when WebView's load exits.
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("load finished")
        stopAnimation()
    }
}
