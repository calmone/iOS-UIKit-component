//
//  WebPdfFileVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 21..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class WebPdfFileVC: BaseViewController {
    
    // Generate webView
    lazy var webView: UIWebView = {
        let myWebView = UIWebView()
        myWebView.frame = self.view.bounds
        
        // Get the path of the file managed by the project.
        let path: String = Bundle.main.path(forResource: "iOS_Security_Guide", ofType: "pdf")!
        
        let url = URL(fileURLWithPath: path)
        let request = URLRequest(url: url)
        
        // Request loading.
        myWebView.loadRequest(request as URLRequest)
        
        return myWebView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add webView on view
        self.view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
