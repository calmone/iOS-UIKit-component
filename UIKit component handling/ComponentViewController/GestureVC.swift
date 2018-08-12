//
//  GestureVC.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 8. 12..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class GestureVC: BaseViewController {
    
    private var tapLabel: UILabel!
    private var pinchGestureLabel: UILabel!
    private var swipeLabel: UILabel!
    private var longPressLabel: UILabel!
    private var panLabel: UILabel!
    private var rotateLabel: UILabel!
    private var edgeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Recognize the tap.
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture(sender:)))
        
        // Pinch recognition.
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(sender:)))
        
        // Swipe recognition.
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        
        // Swipe recognition - Swipe with 2 fingers.
        swipe.numberOfTouchesRequired = 2
        
        // Recognized long press.
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(sender:)))
        
        // Press and hold - Press and hold for at least 2 seconds.
        longPressGesture.minimumPressDuration = 2.0
        
        // Long press - Finger displacement is up to 15px.
        longPressGesture.allowableMovement = 150
        
        // Pan recognition.
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panGesture(sender:)))
        
        // Pan recognition - 3 breads with your fingers.
        pan.minimumNumberOfTouches = 3
        
        // Recognize rotation.
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateGesture(sender:)))
        
        // Recognize edges.
        let screenEdgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgeGesture(sender:)))
        
        // Recognize edge - Reaction with three fingers at minimum.
        screenEdgePan.minimumNumberOfTouches = 4
        
        // edge recognition - right side.
        screenEdgePan.edges = UIRectEdge.right
        
        // Added to View.
        self.view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(pinchGesture)
        self.view.addGestureRecognizer(swipe)
        self.view.addGestureRecognizer(longPressGesture)
        self.view.addGestureRecognizer(pan)
        self.view.addGestureRecognizer(rotate)
        self.view.addGestureRecognizer(screenEdgePan)
        
        let centerOfX = self.view.bounds.width / 2
        
        // Create Label.
        tapLabel = generateLabel(title: "Tap", color: UIColor.green, posX: centerOfX - 50 , posY: 100)
        pinchGestureLabel = generateLabel(title: "Pinch", color: UIColor.purple, posX: centerOfX + 50, posY: 100)
        swipeLabel = generateLabel(title: "Swipe", color: UIColor.blue, posX: centerOfX - 50, posY: 190)
        longPressLabel = generateLabel(title: "Long", color: UIColor.orange, posX: centerOfX + 50, posY: 190)
        panLabel = generateLabel(title: "Pan", color: UIColor.cyan, posX: centerOfX - 50, posY: 280)
        rotateLabel = generateLabel(title: "Rotate", color: UIColor.black, posX: centerOfX + 50, posY: 280)
        edgeLabel = generateLabel(title: "Edge", color: UIColor.red, posX: centerOfX - 50, posY: 370)
        
        // Add label on View.
        self.view.addSubview(tapLabel)
        self.view.addSubview(pinchGestureLabel)
        self.view.addSubview(swipeLabel)
        self.view.addSubview(longPressLabel)
        self.view.addSubview(panLabel)
        self.view.addSubview(rotateLabel)
        self.view.addSubview(edgeLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Tap event.
    @objc func tapGesture(sender: UITapGestureRecognizer){
        tapLabel.text = "\(sender.numberOfTouches)"
    }
    
    // Implementation of pinch events.
    @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
        let firstPoint = sender.scale
        let secondPoint = sender.velocity
        pinchGestureLabel.text = "\(Double(Int(firstPoint*100))/100)\n\(Double(Int(secondPoint*100))/100)"
    }
    
    // Swipe event
    @objc func swipeGesture(sender: UISwipeGestureRecognizer) {
        let touches = sender.numberOfTouches
        swipeLabel.text = "\(touches)"
    }
    
    // Long press event.
    @objc func longPressGesture(sender: UILongPressGestureRecognizer) {
        // Detect that your finger has left
        if sender.state == UIGestureRecognizerState.ended {
            longPressLabel.text = "On"
        }
    }
    
    // Pan recognition
    @objc func panGesture(sender: UIPanGestureRecognizer) {
        panLabel.text = "\(sender.numberOfTouches)"
    }
    
    // Rotation.
    @objc func rotateGesture(sender: UIRotationGestureRecognizer) {
        let firstPoint = sender.rotation
        let secondPoint = sender.velocity
        rotateLabel.text = "\(Double(Int(firstPoint*100))/100)\n\(Double(Int(secondPoint*100))/100)"
    }
    
    // Edge.
    @objc func edgeGesture(sender: UIScreenEdgePanGestureRecognizer) {
        let touches = sender.numberOfTouches
        swipeLabel.text = "\(touches)"
    }
    
    private func generateLabel(title: String, color: UIColor, posX: CGFloat, posY: CGFloat) -> UILabel{
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        label.text = title
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        label.backgroundColor = color
        label.numberOfLines = 2
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 40.0
        label.layer.position = CGPoint(x: posX, y: posY+100)
        
        return label
    }
    
}
