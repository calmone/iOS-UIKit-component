//
//  CustomizeButtonVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 14..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class CustomizeButtonVC: BaseViewController {
    
    lazy var button: CustomizeButton = {
        let cb = CustomizeButton(frame: CGRect(x: 50, y: 150, width: 100, height: 100))
        cb.setTitle("button", for: UIControlState.normal)
        cb.setTitleColor(UIColor.black, for: UIControlState.normal)
        cb.addTarget(self, action: #selector(onClickButton(sender:)), for: .touchUpInside)
        
        return cb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add button on view
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func onClickButton(sender: UIButton) {
        print("onClickButton:")
        print("sender.currentTitile: \(sender.currentTitle!)")
    }

}

class CustomizeButton: UIButton {
    
    var status: ButtonStatus!
    enum ButtonStatus {
        case Normal
        case TouchBegan
        case TouchEnded
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        status = .Normal
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        status = .TouchBegan
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        status = .TouchEnded
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        let width = rect.width, height = rect.height
        
        if status == .Normal || status == .TouchEnded {
            // color definition.
            let color = UIColor(red: 0.081, green: 1.000, blue: 0.421, alpha: 1.000)
            
            // Define the shape of the button.
            let path = makeNormalPath(width: width, height: height)
            color.setFill()
            path.fill()
            path.lineWidth = 0
            path.stroke()
            
        } else if status == .TouchBegan {
            // color definition.
            let color = UIColor(red: 1.000, green: 1.000, blue: 0.421, alpha: 1.000)
            
            // Define the shape of the button.
            let path = makeNormalPath(width: width, height: height)
            color.setFill()
            path.fill()
            path.lineWidth = 0
            path.stroke()
        }
        
        super.draw(rect)
    }
    
    // Create button shape.
    private func makeNormalPath(width: CGFloat, height: CGFloat) -> UIBezierPath{
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x:46.33/120 * width, y:0.5/120 * height))
        bezierPath.addCurve(to: CGPoint(x:37.47/120 * width, y:30.41/120 * height),
                            controlPoint1: CGPoint(x:38.21/120 * width, y:0.5/120 * height),
                            controlPoint2: CGPoint(x:45.96/120 * width, y:18.21/120 * height))
        bezierPath.addCurve(to: CGPoint(x:0.54/120 * width, y:30.41/120 * height),
                            controlPoint1: CGPoint(x:28.97/120 * width, y:42.61/120 * height),
                            controlPoint2: CGPoint(x:2.75/120 * width, y:21.75/120 * height))
        bezierPath.addCurve(to: CGPoint(x:28.61/120 * width, y:65.04/120 * height),
                            controlPoint1: CGPoint(x:-1.68/120 * width, y:39.06/120 * height),
                            controlPoint2: CGPoint(x:28.61/120 * width, y:53.23/120 * height))
        bezierPath.addCurve(to: CGPoint(x:12.36/120 * width, y:96.52/120 * height),
                            controlPoint1: CGPoint(x:28.61/120 * width, y:76.84/120 * height),
                            controlPoint2: CGPoint(x:4.23/120 * width, y:91.79/120 * height))
        bezierPath.addCurve(to: CGPoint(x:61.1/120 * width, y:83.92/120 * height),
                            controlPoint1: CGPoint(x:20.48/120 * width, y:101.24/120 * height),
                            controlPoint2: CGPoint(x:38.21/120 * width, y:83.92/120 * height))
        bezierPath.addCurve(to: CGPoint(x:100.99/120 * width, y:105.96/120 * height),
                            controlPoint1: CGPoint(x:84/120 * width, y:83.92/120 * height),
                            controlPoint2: CGPoint(x:95.82/120 * width, y:114.62/120 * height))
        bezierPath.addCurve(to: CGPoint(x:86.22/120 * width, y:65.04/120 * height),
                            controlPoint1: CGPoint(x:106.16/120 * width, y:97.3/120 * height),
                            controlPoint2: CGPoint(x:83.63/120 * width, y:81.56/120 * height))
        bezierPath.addCurve(to: CGPoint(x:114.29/120 * width, y:13.09/120 * height),
                            controlPoint1: CGPoint(x:88.8/120 * width, y:48.51/120 * height),
                            controlPoint2: CGPoint(x:117.24/120 * width, y:17.81/120 * height))
        bezierPath.addCurve(to: CGPoint(x:69.97/120 * width, y:30.41/120 * height),
                            controlPoint1: CGPoint(x:111.33/120 * width, y:8.37/120 * height),
                            controlPoint2: CGPoint(x:86.96/120 * width, y:37.88/120 * height))
        bezierPath.addCurve(to: CGPoint(x:46.33/120 * width, y:0.5/120 * height),
                            controlPoint1: CGPoint(x:52.98/120 * width, y:22.93/120 * height),
                            controlPoint2: CGPoint(x:54.46/120 * width, y:0.5/120 * height))
        bezierPath.close()
        
        return bezierPath
    }
}
