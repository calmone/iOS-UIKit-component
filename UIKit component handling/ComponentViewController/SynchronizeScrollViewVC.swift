//
//  SynchronizeScrollViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SynchronizeScrollViewVC: BaseViewController {
    
    // UIPageControl.
    var pageControl: UIPageControl!
    // UIScrillView.
    var scrollViewHeader: UIScrollView!
    var scrollViewMain: UIScrollView!
    // The page number.
    let pageSize = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Get screen size.
        let width = self.view.frame.maxX
        let height = self.view.frame.maxY
        
        // Set ScrollViewHeader.
        scrollViewHeader = UIScrollView(frame: self.view.frame)
        scrollViewHeader.showsHorizontalScrollIndicator = false
        scrollViewHeader.showsVerticalScrollIndicator = false
        scrollViewHeader.isPagingEnabled = true
        scrollViewHeader.delegate = self
        scrollViewHeader.contentSize = CGSize(width:CGFloat(pageSize) * width, height:0)
        self.view.addSubview(scrollViewHeader)
        
        // Set ScrollViewMain.
        scrollViewMain = UIScrollView(frame: self.view.frame)
        scrollViewMain.showsHorizontalScrollIndicator = false
        scrollViewMain.showsVerticalScrollIndicator = false
        scrollViewMain.isPagingEnabled = true
        scrollViewMain.delegate = self
        scrollViewMain.contentSize = CGSize(width:CGFloat(pageSize) * width, height:0)
        self.view.addSubview(scrollViewMain)
        
        // Generate Label to be pasted on ScrollView1.
        for i in 0 ..< pageSize {
            // Display a different label for each page.
            let label: UILabel = UILabel(frame: CGRect(x: CGFloat(i)*width+width/2-40, y: height/2 - 40, width: 80, height: 80))
            label.backgroundColor = UIColor.black
            label.textColor = UIColor.white
            label.textAlignment = NSTextAlignment.center
            label.layer.masksToBounds = true
            label.text = "Page\(i)"
            label.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            label.layer.cornerRadius = 40.0
            
            scrollViewMain.addSubview(label)
        }
        
        // Generate Label to be pasted to ScrollView2.
        for i in 0 ..< pageSize {
            // Display a different label for each page.
            let label: UILabel = UILabel(frame: CGRect(x: CGFloat(i)*width/4, y: 50, width: 80, height: 60))
            label.backgroundColor = UIColor.red
            label.textColor = UIColor.white
            label.textAlignment = NSTextAlignment.center
            label.layer.masksToBounds = true
            label.text = "Page\(i)"
            label.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            label.layer.cornerRadius = 30.0
            
            scrollViewHeader.addSubview(label)
        }
        
        // Create PageControl.
        pageControl = UIPageControl(frame: CGRect(x: 0, y: self.view.frame.maxY - 50, width: width, height: 50))
        pageControl.backgroundColor = UIColor.lightGray
        
        // Set the number of pages to be PageControl.
        pageControl.numberOfPages = pageSize
        
        // Set the current page.
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        self.view.addSubview(pageControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension SynchronizeScrollViewVC: UIScrollViewDelegate {
    
    // Called when the ScrollView is moved.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollViewMain {
            scrollViewHeader.contentOffset.x = scrollViewMain.contentOffset.x/4
        }
    }
    
    // It is called when movement is completed.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // If the number of scrolls is one page.
        if fmod(scrollViewMain.contentOffset.x, scrollViewMain.frame.maxX) == 0 {
            // Toggle the page location.
            pageControl.currentPage = Int(scrollViewMain.contentOffset.x / scrollViewMain.frame.maxX)
        }
    }
    
}
