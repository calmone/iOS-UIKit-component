//
//  BlurEffectVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 10..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class BlurEffectVC: BaseViewController {
    
    private var effectView: UIVisualEffectView!
    
    lazy var segcontrol: UISegmentedControl = {
        // Generate SegmentedControl.
        let sc: UISegmentedControl = UISegmentedControl(items: ["Dark", "Light", "ExtraLight"])
        sc.center = CGPoint(x: self.view.center.x, y: self.view.bounds.maxY - 50)
        sc.backgroundColor = UIColor.gray
        sc.tintColor = UIColor.white
        sc.addTarget(self, action: #selector(onClickSegmentedControl(sender:)), for: UIControlEvents.valueChanged)
        
        return sc
    }()
    
    lazy var imageView: UIImageView = {
        // Generate background image.
        let image = UIImage(named: "vertical.jpeg")
        let iv = UIImageView(frame: self.view.bounds)
        iv.image = image
        
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add iamgeView on view
        self.view.addSubview(self.imageView)
        
        // Add segmentedControl on view
        self.view.addSubview(self.segcontrol)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Apply the effect.
    func addVirtualEffectView(effect : UIBlurEffect!){
        
        if effectView != nil {
            effectView.removeFromSuperview()
        }
        
        // Create EffectView to apply Blur effect.
        effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        effectView.layer.position = CGPoint(x: self.segcontrol.bounds.midX, y: -(effectView.frame.midY + 20) )
        effectView.layer.masksToBounds = true
        effectView.layer.cornerRadius = 20.0
        self.segcontrol.addSubview(effectView)
    }
    
    // The method to be called when the value of SegmentedControl has changed.
    @objc func onClickSegmentedControl(sender : UISegmentedControl){
        
        var effect : UIBlurEffect!
        
        switch sender.selectedSegmentIndex {
        case 0:
            // Create a dark Blur effect.
            effect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        case 1:
            // Create a light Blur effect.
            effect = UIBlurEffect(style: UIBlurEffectStyle.light)
        case 2:
            // Create a extra light Blur effect.
            effect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
        default: return
        }
        
        self.addVirtualEffectView(effect: effect)
    }
    
}
