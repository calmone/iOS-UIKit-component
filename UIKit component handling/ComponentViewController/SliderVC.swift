//
//  SliderVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 9..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class SliderVC: BaseViewController {
    
    // Set the image.
    private let inputImage = CIImage(image: UIImage(named: "vertical.jpeg")!)
    
    // Define the ImageView.
    lazy var imageView: UIImageView = {
        // Create a UIImageView.
        let imageView = UIImageView(frame: self.view.frame)
        imageView.image = UIImage(ciImage: inputImage!)
        return imageView
    }()
    
    lazy var slider: UISlider = {
        // Create a Slider.
        let greenSlider = UISlider(frame: CGRect(x:0, y:0, width:200, height:30))
        greenSlider.layer.position = CGPoint(x:self.view.frame.midX, y:500)
        greenSlider.backgroundColor = UIColor.white
        greenSlider.layer.cornerRadius = 10.0
        greenSlider.layer.shadowOpacity = 0.5
        greenSlider.layer.masksToBounds = false
        
        // Set the minimum and maximum values.
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        // Set the position of Slider.
        greenSlider.value = 0.5
        
        // Change the Tint color to the right of the current position of the Slider.
        greenSlider.maximumTrackTintColor = UIColor.gray
        
        // Change the Tint color to the left of the current position of the Slider.
        greenSlider.minimumTrackTintColor = UIColor.black
        
        greenSlider.addTarget(self, action: #selector(onChangeValueSlider(sender:)), for: UIControlEvents.valueChanged)
        
        return greenSlider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UIImageView on view
        self.view.addSubview(self.imageView)
        
        // Add UISlider on view
        self.view.addSubview(self.slider)
        
        self.view.backgroundColor = UIColor(red: 0, green: CGFloat(slider.value), blue: 0, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Method called when the value of Slider changes
    @objc func onChangeValueSlider(sender: UISlider){
        
        // Change the green value of the background of the view according to the value of Slider.
        self.view.backgroundColor = UIColor(red: 0, green: CGFloat(sender.value), blue: 0, alpha: 1)
        
        // Instantiate CIFilter with color effect specified.
        let colorFilter = CIFilter(name: "CIColorCrossPolynomial")
        
        // Set the image.
        colorFilter!.setValue(self.inputImage, forKey: kCIInputImageKey)
        
        // Create converted value of RGB.
        let r: [CGFloat] = [0.0, CGFloat(sender.value), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        let g: [CGFloat] = [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        let b: [CGFloat] = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        // Adjust the value.
        colorFilter!.setValue(CIVector(values: r, count: 10), forKey: "inputRedCoefficients")
        colorFilter!.setValue(CIVector(values: g, count: 10), forKey: "inputGreenCoefficients")
        colorFilter!.setValue(CIVector(values: b, count: 10), forKey: "inputBlueCoefficients")
        
        // Output the image processed by the filter.
        let outputImage : CIImage = colorFilter!.outputImage!
        
        // Set the UIView processed image again.
        self.imageView.image = UIImage(ciImage: outputImage)
        
        // Perform redrawing.
        self.imageView.setNeedsDisplay()
    }
    
}
