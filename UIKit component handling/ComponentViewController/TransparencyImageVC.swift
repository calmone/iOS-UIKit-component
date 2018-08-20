//
//  TransparencyImageVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 17..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class TransparencyImageVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Image settings.
        let image: UIImage = UIImage(named:"vertical.jpeg")!
        
        // Specify the resized UIImage and make UIImageView.
        let imageView = UIImageView(image: image.ResizeUIImage(width: self.view.frame.maxX, height: self.view.frame.maxY))
        
        // Set alpha
        imageView.alpha = 0.5
        
        // Add imageView on view
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

fileprivate extension UIImage {
    
    // Create a class method of Resize.
    func ResizeUIImage(width: CGFloat, height: CGFloat) -> UIImage! {
        
        // Prepare the context of the specified image size.
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // Draw the image in the context.
        self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        
        // Create a UIImage from the context.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // Close the context.
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}
