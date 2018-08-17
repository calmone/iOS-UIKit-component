//
//  SectionCollectionViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 17..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SectionCollectionViewVC: BaseViewController {
    
    lazy var collectionView: UICollectionView = {
        // Generate layout of CollectionView.
        let layout = UICollectionViewFlowLayout()
        
        // The size of each Cell.
        layout.itemSize = CGSize(width:50, height:50)
        
        // Margin of Cell.
        layout.sectionInset = UIEdgeInsetsMake(16, 16, 32, 16)
        
        // Header size per section.
        layout.headerReferenceSize = CGSize(width:100,height:50)
        
        // Generate CollectionView.
        let cv = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        // Register the class used for Cell.
        cv.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Section")
        
        cv.delegate = self
        cv.dataSource = self
        
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add collectionView on view
        self.view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SectionCollectionViewVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Number of Sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    // Called when Cell is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("SectionNum:\(indexPath.section)")
    }
    
    // Returns the total number of Cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Change the total number of Cells for each Section.
        switch(section) {
        case 0: return 5
        case 1: return 8
        case 2: return 20
        default: return 0
        }
    }
    
    // Set a value in Section
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Section", for: indexPath)
        headerView.backgroundColor = UIColor.white
        
        return headerView
    }
    
    // Set a value in Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath as IndexPath) as! CustomUICollectionViewCell
        // Change Cell property for each Section.
        switch(indexPath.section) {
        case 0: cell.configure(text: "0", backgroundColor: UIColor.red)
        case 1: cell.configure(text: "1", backgroundColor: UIColor.green)
        case 2: cell.configure(text: "2", backgroundColor: UIColor.blue)
        default: cell.configure(text: "empty", backgroundColor: UIColor.white)
        }
        
        return cell
    }
    
}

fileprivate class CustomUICollectionViewCell : UICollectionViewCell {
    
    var textLabel : UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configure(text: String, backgroundColor: UIColor) {
        // Generate UILabel.
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        textLabel?.text = text
        textLabel?.backgroundColor = backgroundColor
        textLabel?.textAlignment = NSTextAlignment.center
        
        // Added to Cell.
        self.contentView.addSubview(textLabel!)
    }
    
}
