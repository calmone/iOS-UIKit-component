//
//  AddDeleteTableViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class AddDeleteTableViewVC: BaseViewController {
    
    lazy var tableView: UITableView = {
        // Get the height of the Status Bar.
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        // Get the height and width of View.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // Generate the TableView (displayed with the height of the status bar shifted).
        let tv = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Register Cell.
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "AddDeleteCell")
        
        // DataSource configuration.
        tv.dataSource = self
        
        // Set Delegate.
        tv.delegate = self
        
        // Set the ruled line to blue.
        tv.separatorColor = UIColor.blue
        
        // Allow cell selection during editing.
        tv.allowsSelectionDuringEditing = true
        
        return tv
    }()
    
    var items: [String] = ["TEST1", "TEST2", "TEST3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Added an edit button on the right side of the navigation bar.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Add tableView on view
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension AddDeleteTableViewVC: UITableViewDelegate, UITableViewDataSource {
    
    // Called when Cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // What is the number of selected cells?
        print("Num: \(indexPath.row)")
        
        // value of the selected cell.
        print("Value: \(items[indexPath.row])")
        
        // Can you edit the selected cell?
        print("Edeintg: \(tableView.isEditing)")
    }
    
    
    // Returns the total number of Cells (Implementation required)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Set a value in Cell (Implementation required)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddDeleteCell", for: indexPath as IndexPath)
        // Set the value in Cell.
        cell.textLabel?.text = "\(items[indexPath.row])"
        
        return cell
    }
    
    // Called when the edit button is pressed
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        // Making TableView editable
        tableView.setEditing(editing, animated: true)
        
        // Display addButton to the left of the navigation bar only while editing
        if editing {
            print("While editing")
            let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addCell(sender:)))
            self.navigationItem.setLeftBarButton(addButton, animated: true)
        } else {
            print("Normal mode")
            self.navigationItem.setLeftBarButton(nil, animated: true)
        }
    }
    
    // Called when addButton is pressed
    @objc func addCell(sender: AnyObject) {
        print("Add")
        
        // Added to items.
        items.append("add Cell")
        
        // Reload the TableView.
        tableView.reloadData()
    }
    
    // Called when trying to insert or delete Cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // When deleting.
        if editingStyle == UITableViewCellEditingStyle.delete {
            print("Delete")
            
            // Delete the object of the specified cell from items.
            items.remove(at: indexPath.row)
            
            // Reload the TableView.
            tableView.reloadData()
        }
    }
    
}
