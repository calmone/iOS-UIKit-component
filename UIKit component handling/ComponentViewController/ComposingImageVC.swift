//
//  ComposingImageVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 20..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ComposingImageVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Make the first UIImage.
        var image_1 = UIImage(named: "vertical.jpeg")!
        
        // Resize.
        image_1 = image_1.ResizeUIImage(width: self.view.frame.maxX, height: self.view.frame.maxY)
        
        // Make a second UIImage.
        var image_2 = UIImage(named: "apple.png")!
        
        // Resize.
        image_2 = image_2.ResizeUIImage(width: self.view.frame.midX, height: self.view.frame.midY)
        
        // Composite images.
        let ComposedImage = UIImage.ComposeUIImage(UIImageArray: [image_1, image_2], width: self.view.frame.maxX, height: self.view.frame.maxY)
        
        // Specify the UIImage synthesized in UIImageView.
        let myImageView = UIImageView(image: ComposedImage)
        
        self.view.addSubview(myImageView)
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
    
    // Class method to synthesize images.
    class func ComposeUIImage(UIImageArray : [UIImage], width: CGFloat, height : CGFloat) -> UIImage! {
        
        // Prepare the context of the specified image size.
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // Turn it by the amount of UIImage.
        for image: UIImage in UIImageArray {
            // Draw the image in the context.
            image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        }
        
        // Create a UIImage from the context.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // Close the context.
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}
