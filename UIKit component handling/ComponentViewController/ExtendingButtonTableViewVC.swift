//
//  ExtendingButtonTableViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ExtendingButtonTableViewVC: BaseViewController {
    
    var items: [String] = ["TEST1", "TEST2", "TEST3"]
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Get the height of the Status Bar.
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        // Get the height and width of the view.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // Generate TableView (displayed by the height of status bar).
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight + 50, width: displayWidth, height: displayHeight - barHeight - 50))
        
        // Cell registration.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExtendingCell")
        
        // Set the DataSource.
        tableView.dataSource = self
        
        // Set the delegate.
        tableView.delegate = self
        
        // Add to View.
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ExtendingButtonTableViewVC: UITableViewDelegate, UITableViewDataSource {
    
    // Called when Cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(items[indexPath.row])")
    }
    
    // Returns the total number of cells.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return items.count
    }
    
    // Editable state.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        print("canEditRowAtIndexPath")
        return true
    }
    
    // Enable button operation for a specific row.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("commitEdittingStyle:\(editingStyle)")
    }
    
    // Set a value for Cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAtIndexPath")
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ExtendingCell", for: indexPath)
        cell.textLabel?.text = "\(items[indexPath.row])"
        return cell
    }
    
    // Extend the Button.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Share button.
        let shareButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "Share") { (action, index) -> Void in
            tableView.isEditing = false
            print("share")
        }
        shareButton.backgroundColor = UIColor.blue
        
        // Archive button.
        let archiveButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "Archive") { (action, index) -> Void in
            tableView.isEditing = false
            print("archive")
        }
        archiveButton.backgroundColor = UIColor.red
        
        return [shareButton, archiveButton]
    }
}
