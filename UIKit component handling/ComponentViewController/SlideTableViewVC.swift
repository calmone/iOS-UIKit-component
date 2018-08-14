//
//  SlideTableViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SlideTableViewVC: BaseViewController {
    
    // UIPageControl.
    var pageControl: UIPageControl!
    // UIScrollView.
    lazy var scrollView: UIScrollView = {
        // Setting the ScrollView.
        let width = self.view.frame.maxX
        let height = self.view.frame.maxY
        let sv = UIScrollView(frame: self.view.frame)
        sv.showsHorizontalScrollIndicator = false;
        sv.showsVerticalScrollIndicator = false
        sv.isPagingEnabled = true
        sv.delegate = self
        sv.contentSize = CGSize(width: CGFloat(pageSize) * width, height: 0)
        
        return sv
    }()
    // Items in the TableView.
    let items: [[String]] = [["TEST1", "TEST2", "TEST3"], ["App1", "App2", "App3", "App4", "App5"]]
    // The title to display in the TableView.
    let titles: [String] = ["title 0", "title 1"]
    // TableViews.
    var tableViews: [UITableView] = []
    // The page number.
    let pageSize = 2

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add scrollview on view
        self.view.addSubview(scrollView)
        
        let width = self.view.frame.maxX
        let height = self.view.frame.maxY
        
        // Get the height of the Status Bar.
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        // Get the height and width of the view.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // Generate TableView (displayed by the height of status bar).
        for i in 0 ..< pageSize {
            let tableView: UITableView = UITableView(frame: CGRect(x: CGFloat(i) * width, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
            tableViews.append(tableView)
            tableViews[i].register(UITableViewCell.self, forCellReuseIdentifier: "SlideTableViewCell")
            tableViews[i].dataSource = self
            tableViews[i].delegate = self
            scrollView.addSubview(tableViews[i])
            
            // Display a different label for each page.
            let myLabel:UILabel = UILabel(frame: CGRect(x: CGFloat(i) * width + width/2 - 40, y: height/2 - 40, width: 80, height: 80))
            myLabel.backgroundColor = UIColor.black
            myLabel.textColor = UIColor.white
            myLabel.textAlignment = NSTextAlignment.center
            myLabel.layer.masksToBounds = true
            myLabel.text = "Page\(i)"
            myLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            myLabel.layer.cornerRadius = 40.0
            
            scrollView.addSubview(myLabel)
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

extension SlideTableViewVC: UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // If the number of scrolls is one page.
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
            // Toggle the page location.
            pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        }
    }
    
    // Called when Cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableViews[0] {
            print("Num: \(indexPath.row)")
            print("Value: \(items[0][indexPath.row])")
        } else if tableView == tableViews[1] {
            print("Num: \(indexPath.row)")
            print("Value: \(items[1][indexPath.row])")
        }
    }
    
    // Returns the total number of cells.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViews[0] {
            return items[0].count
        } else if tableView == tableViews[1] {
            return items[1].count
        } else{
            return 0
        }
    }
    
    // Header added.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 100))
        label.textAlignment = .center
        
        if tableView == tableViews[0] {
            label.backgroundColor = UIColor.black
            label.textColor = UIColor.white
            label.text = titles[0]
        } else if tableView == tableViews[1] {
            label.backgroundColor = UIColor.blue
            label.textColor = UIColor.white
            label.text = titles[1]
        }
        
        return label
    }
    
    // Header height.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    // Set a value for Cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SlideTableViewCell", for: indexPath as IndexPath)
        
        if tableView == tableViews[0] {
            cell.textLabel?.text = "\(items[0][indexPath.row])"
        } else if tableView == tableViews[1] {
            cell.textLabel?.text = "\(items[1][indexPath.row])"
        }
        
        return cell
    }
    
}
