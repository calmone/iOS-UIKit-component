//
//  SearchBarVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 9..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SearchBarVC: BaseViewController, UISearchBarDelegate {
    
    lazy var searchBar: UISearchBar = {
        // Create a search bar.
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        searchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 150)
        
        // Add a shadow.
        searchBar.layer.shadowColor = UIColor.black.cgColor
        searchBar.layer.shadowOpacity = 0.5
        searchBar.layer.masksToBounds = false
        
        // Enable the Cancel button.
        searchBar.showsCancelButton = true
        
        // Disable the bookmark button.
        searchBar.showsBookmarkButton = false
        
        // Set bar style to Default.
        searchBar.searchBarStyle = UISearchBarStyle.default
        
        // Set a title.
        searchBar.prompt = "Title"
        
        // Set descriptive text.
        searchBar.placeholder = "Please enter here"
        
        // Set the color of the cursor and cancel button.
        searchBar.tintColor = UIColor.red
        
        // The search result display button is not displayed.
        searchBar.showsSearchResultsButton = false
        
        return searchBar
    }()
    
    lazy var label : UILabel = {
        // Create a UILabel.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        label.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        label.text = ""
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.cornerRadius = 10.0
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UISearchBar on view
        self.view.addSubview(self.searchBar)
        
        // Add UILabel on view
        self.view.addSubview(self.label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called whenever text is changed
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.label.text = searchText
    }
    
    // Called when the Cancel button is pressed
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.label.text = ""
        self.searchBar.text = ""
    }
    
    // Called when the Search button is pressed
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.label.text = "Searching"
        self.searchBar.text = ""
        self.view.endEditing(true)
    }

}
