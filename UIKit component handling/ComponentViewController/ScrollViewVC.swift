//
//  ScrollViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 6..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ScrollViewVC: BaseViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        
        // Generate ScrollView.
        scrollView.frame = self.view.frame
        
        // Disable ScrollView bounces
        scrollView.bounces = false
        
        // Set the image in UIImage.
        let image = UIImage(named: "vertical.jpeg")!
        
        // Create a UIImageView.
        let imageView = UIImageView()
        
        // Set myImage to the image of imageView.
        imageView.image = image
        
        // Set the value of frame size
        imageView.frame.size = image.size
        
        // Set the aspect ratio of the image.
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        
        // Add imageView to ScrollView.
        scrollView.addSubview(imageView)
        
        // Set contentSize to ScrollView.
        scrollView.contentSize = imageView.frame.size
        
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UIScrollView on view
        self.view.addSubview(self.scrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
