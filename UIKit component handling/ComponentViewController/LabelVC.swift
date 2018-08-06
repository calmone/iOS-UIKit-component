//
//  LabelVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 7. 27..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class LabelVC: BaseViewController {

    lazy var label: UILabel = {
        // Define the size of the label.
        let width: CGFloat = 300
        let height: CGFloat = 100
        
        // Define coordinates to be placed.
        // (center of screen)
        let posX: CGFloat = self.view.bounds.width/2 - width/2
        let posY: CGFloat = self.view.bounds.height/2 - height/2
        
        // Label Create.
        let label: UILabel = UILabel(frame: CGRect(x: posX, y: posY, width: width, height: height))
        
        // Define background color.
        label.backgroundColor = .orange
        
        // Define text color.
        label.textColor = .white
        
        // Define text font.
        label.font = .systemFont(ofSize: 20, weight: .regular)
        
        // Define text of label.
        label.text = "Hello Calmone!! :)"
        
        // Define count of line.
        // '0' is infinity
        label.numberOfLines = 0
        
        // Round UILabel frame.
        label.layer.masksToBounds = true
        
        // Radius of rounded corner.
        label.layer.cornerRadius = 20.0
        
        // Define shadow color.
        label.shadowColor = .gray
        
        // Define text Alignment.
        // options) .left, .right, .center, .justified, .natural
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UILabel to view.
        self.view.addSubview(self.label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
