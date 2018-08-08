//
//  SectionTableViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 8..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SectionTableViewVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    // Define the array to use in the Table.
    private let iOSItems: [String] = ["iOS12", "iOS11", "iOS10", "iOS9", "iOS8", "iOS7"]
    private let AOSItems: [String] = ["9.x", "8.x", "7.x", "6.x"]
    
    // Define the array to be used in Section.
    private let sections: [String] = ["iOS", "AOS"]
    
    lazy var tableView: UITableView = {
        // Get the height of the Status Bar.
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        // Get the height and width of the View.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        let tableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Register the Cell name.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "sectionTableViewCell")
        
        // Set the DataSource.
        tableView.dataSource = self
        
        // Set Delegate.
        tableView.delegate = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UITableView on view
        self.view.addSubview(self.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Returns the number of sections.
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // Returns the title of the section.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    // Called when Cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("Value: \(iOSItems[indexPath.row])")
        } else if indexPath.section == 1 {
            print("Value: \(AOSItems[indexPath.row])")
        } else {
            return
        }
    }
    
    // Returns the total number of arrays to display in the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return iOSItems.count
        } else if section == 1 {
            return AOSItems.count
        } else {
            return 0
        }
    }
    
    // Set a value in Cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionTableViewCell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(iOSItems[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(AOSItems[indexPath.row])"
        } else {
            return UITableViewCell()
        }
        
        return cell
    }


}
