//
//  ScreenshotVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 20..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class ScreenshotVC: BaseViewController {

    // Generate Label.
    lazy var label: UILabel = {
        let l = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        l.text = "Circle"
        l.textColor = UIColor.white
        l.layer.cornerRadius = 50.0
        l.layer.masksToBounds = true
        l.backgroundColor = UIColor.orange
        l.textAlignment = NSTextAlignment.center
        l.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2 - 100)
        
        return l
    }()
    
    // Generate ImageView.
    lazy var imageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        iv.layer.borderColor = UIColor.black.cgColor
        iv.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 200)
        iv.layer.borderWidth = 0.5

        return iv
    }()
    
    // Generate Button
    lazy var button: UIButton = {
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        b.setTitle("push", for: UIControlState.normal)
        b.setTitleColor(UIColor.blue, for: UIControlState.normal)
        b.addTarget(self, action: #selector(onClickButton(_:)), for: UIControlEvents.touchDown)
        b.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 50)
        
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add label on view
        self.view.addSubview(label)
        
        // Add imageView on view
        self.view.addSubview(imageView)
        
        // Add button on view
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func onClickButton(_ sender: UIButton) {
        // Acquire capture image.
        let myImage = label.GetImage()
        
        // Set to ImageView image.
        imageView.image = myImage
        
        // Adjust the image to the size of the UIImageView while keeping the aspect ratio.
        imageView.contentMode = UIViewContentMode.scaleAspectFit
    }
    
}

fileprivate extension UIView {
    
    func GetImage() -> UIImage{
        
        // Get range to capture.
        let rect = self.bounds
        
        // Create the context of the bitmap image.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        // Copy the drawing in the target view to the context.
        self.layer.render(in: context)
        
        // Get the current context's bitmap as UIImage.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        // Close the context.
        UIGraphicsEndImageContext()
        
        return capturedImage
    }
}
