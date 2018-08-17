//
//  CollectionViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 17..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class CollectionViewVC: BaseViewController {
    
    lazy var collectionView: UICollectionView = {
        // Generate layout of CollectionView.
        let layout = UICollectionViewFlowLayout()
        
        // The size of each Cell.
        layout.itemSize = CGSize(width:50, height:50)
        
        // Margin of Cell.
        layout.sectionInset = UIEdgeInsetsMake(16, 16, 32, 16)
        
        // Header size per section.
        layout.headerReferenceSize = CGSize(width:100,height:30)
        
        // Generate CollectionView.
        let cv = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        // Register the class used for Cell.
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
        
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

extension CollectionViewVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Called when Cell is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Num: \(indexPath.row)")
        print("Value:\(collectionView)")
        
    }
    
    // Returns the total number of Cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    // Set a value in Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.orange
        
        return cell
    }
    
}
