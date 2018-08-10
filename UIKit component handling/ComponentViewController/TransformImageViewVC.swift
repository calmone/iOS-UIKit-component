//
//  TransformImageViewVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 5..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class TransformImageViewVC: BaseViewController {
    
    // Set the image.
    let image: UIImage = UIImage(named: "apple.png")!
    let imageWidth: CGFloat = 200
    let imageHeight: CGFloat = 50
    
    lazy var scaleDownImageView: UIImageView = {
        // Reduce the image (0.5 times)
        // Set the coordinates to display.
        let downPosX: CGFloat = (self.view.bounds.width - self.imageWidth) / 2
        let downPosY: CGFloat = 150
        
        // Generate UIImageView for display.
        let imageView: UIImageView = UIImageView(frame:  CGRect(x: downPosX, y: downPosY, width: self.imageWidth, height: self.imageHeight))
        
        // Set the image in UIImageView.
        imageView.image = self.image
        
        // Generate an affine matrix for reduction (0.5 times).
        imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        return imageView
    }()
    
    lazy var scaleUpImageView: UIImageView = {
        // Enlarge the image (1.2 times)
        // Set the coordinates to display.
        let upPosX: CGFloat = (self.view.bounds.width - self.imageWidth) / 2
        let upPosY: CGFloat = 250
        
        // Generate UIImageView for display.
        let imageView: UIImageView = UIImageView(frame:  CGRect(x: upPosX, y: upPosY, width: self.imageWidth, height: self.imageHeight))
        
        // Set the image in UIImageView.
        imageView.image = self.image
        
        // Generate an affine matrix for enlarge (1.2 times).
        imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        return imageView
    }()
    
    lazy var rotateImageView: UIImageView = {
        // Rotate the image.
        // Set the coordinates to display.
        let rotatePosX: CGFloat = (self.view.bounds.width - self.imageWidth) / 2
        let rotatePosY: CGFloat = 450
        
        // Generate UIImageView for display.
        let imageView: UIImageView = UIImageView(frame: CGRect(x: rotatePosX, y: rotatePosY, width: self.imageWidth, height: self.imageHeight))
        
        // Set the image in UIImageView.
        imageView.image = self.image
        
        // Specify rotation angle with radian (30 degrees).
        let angle: CGFloat = CGFloat((30.0 * Double.pi) / 180.0)
        
        // Generate an affine matrix for rotation.
        imageView.transform = CGAffineTransform(rotationAngle: angle)
        
        return imageView
    }()
    
    lazy var reverseImageView: UIImageView = {
        // Flip the image.
        // Set the coordinates to display.
        let reversePosX: CGFloat = (self.view.bounds.width - self.imageWidth) / 2
        let reversePosY: CGFloat = 550
        
        // Generate UIImageView for display.
        let imageView: UIImageView = UIImageView(frame:  CGRect(x: reversePosX, y: reversePosY, width: self.imageWidth, height: self.imageHeight))
        
        // Set the image in UIImageView.
        imageView.image = self.image
        
        // Generate an affine matrix for reduction (0.5 times).
        imageView.transform = imageView.transform.scaledBy(x: -1.0, y: 1.0)
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UIImageViews on view
        self.view.addSubview(self.scaleDownImageView)
        self.view.addSubview(self.scaleUpImageView)
        self.view.addSubview(self.rotateImageView)
        self.view.addSubview(self.reverseImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
