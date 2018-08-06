//
//  ImageViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 7. 31..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ImageViewVC: BaseViewController {
    
    lazy var imageView: UIImageView = {
        // Set the size of UIImageView.
        let width: CGFloat = self.view.bounds.width/2
        let height: CGFloat = 150
        
        // Set x, y of UIImageView.
        let posX: CGFloat = (self.view.bounds.width - width)/2
        let posY: CGFloat = (self.view.bounds.height - height)/2
        
        // Create UIImageView.
        let imageView = UIImageView(frame: CGRect(x: posX, y: posY, width: width, height: height))
        
        // Create UIImage.
        let myImage: UIImage = UIImage(named: "apple.png")!
        
        // Set the image to UIImageView.
        imageView.image = myImage
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UIImageView to view
        self.view.addSubview(self.imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
