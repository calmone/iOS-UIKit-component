//
//  PageControlVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 7..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class PageControlVC: BaseViewController, UIScrollViewDelegate {
    
    // Define the number of pages.
    let pageSize = 4
    
    lazy var pageControl: UIPageControl = {
        // Create a UIPageControl.
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: self.view.frame.maxY - 100, width: self.view.frame.maxX, height:50))
        pageControl.backgroundColor = UIColor.orange
        
        // Set the number of pages to page control.
        pageControl.numberOfPages = pageSize
        
        // Set the current page.
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        return pageControl
    }()
    
    lazy var scrollView: UIScrollView = {
        // Create a UIScrollView.
        let scrollView = UIScrollView(frame: self.view.frame)
        
        // Hide the vertical and horizontal indicators.
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.showsVerticalScrollIndicator = false
        
        // Allow paging.
        scrollView.isPagingEnabled = true
        
        // Set delegate of ScrollView.
        scrollView.delegate = self
        
        // Specify the screen size of the scroll.
        scrollView.contentSize = CGSize(width: CGFloat(pageSize) * self.view.frame.maxX, height: 0)
        
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set the background color to Cyan.
        self.view.backgroundColor = .green
        
        // Get the vertical and horizontal sizes of the view.
        let width = self.view.frame.maxX, height = self.view.frame.maxY
        
        // Generate buttons for the number of pages.
        for i in 0 ..< pageSize {
            // Generate different labels for each page.
            let label: UILabel = UILabel(frame: CGRect(x: CGFloat(i) * width + width/2 - 40, y: height/2 - 40, width: 80, height: 80))
            label.backgroundColor = .red
            label.textColor = .white
            label.textAlignment = .center
            label.layer.masksToBounds = true
            label.text = "Page\(i)"
            
            label.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            label.layer.cornerRadius = 40.0
            
            scrollView.addSubview(label)
        }
        
        // Add UIScrollView, UIPageControl on view
        self.view.addSubview(self.scrollView)
        self.view.addSubview(self.pageControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // When the number of scrolls is one page worth.
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
            // Switch the location of the page.
            pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        }
    }

}
