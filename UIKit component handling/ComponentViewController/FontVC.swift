//
//  FontViewController.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 7. 31..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class FontVC: BaseViewController {

    // Display a character string of a smaller font on the label.
    lazy var smallLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 100, width: 350, height: 150))
        label.text = "Small font"
        label.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        return label
    }()
    
    // Display the label of the system's standard font size string.
    lazy var normalLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 130, width: 350, height: 150))
        label.text = "Normal font"
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        return label
    }()
    
    // Display a character string of font size for UIButton on the label.
    lazy var buttonLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 160, width: 350, height: 150))
        label.text = "UIButton font size"
        label.font = UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        return label
    }()
    
    // Display the character string of the custom font size (20) on the label.
    lazy var customLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 190, width: 350, height: 150))
        label.text = "Font size of point 20"
        label.font = UIFont.systemFont(ofSize: CGFloat(20))
        return label
    }()
    
    // Display the character string of Italic Sysrem Font on the label.
    lazy var italicLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 220, width: 350, height: 150))
        label.text = "Italic Font"
        label.font = UIFont.italicSystemFont(ofSize: UIFont.labelFontSize)
        return label
    }()
    
    // Display the string of Bold on the label.
    lazy var boldLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 250, width: 350, height: 150))
        label.text = "Bold Font"
        label.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        return label
    }()
    
    // Display the character string of Arial on the label.
    lazy var arialLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 280, width: 350, height: 150))
        label.text = "ArialHebrew"
        label.font = UIFont(name: "ArialHebrew", size: UIFont.labelFontSize)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add UILabels on view
        self.view.addSubview(self.smallLabel)
        self.view.addSubview(self.normalLabel)
        self.view.addSubview(self.buttonLabel)
        self.view.addSubview(self.customLabel)
        self.view.addSubview(self.italicLabel)
        self.view.addSubview(self.boldLabel)
        self.view.addSubview(self.arialLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
