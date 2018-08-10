//
//  BaseViewController.swift
//  UIKit component handling
//
//  Created by Taehyeon Han on 2018. 7. 27..
//  Copyright © 2018년 calmone. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

//    var componentName: String!
    
//    private lazy var titleLabel: UILabel = {
//        let l = UILabel()
//        l.text = self.componentName
//        l.numberOfLines = 0
//        l.textAlignment = .center
//        l.font = .systemFont(ofSize: 20, weight: .bold)
//        l.translatesAutoresizingMaskIntoConstraints = false
//        return l
//    }()
    
//    lazy var contentView: UIView = {
//        let v = UIView()
//        v.backgroundColor = .orange
//        v.translatesAutoresizingMaskIntoConstraints = false
//        return v
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
//        self.title = self.componentName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init(componentName: String) {
        super.init(nibName: nil, bundle: nil)
//        self.title = componentName
        self.navigationItem.prompt = componentName
//        self.componentName = componentName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func appDelegate() -> AppDelegate? {
        guard let app = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return app
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
//        self.view.addSubview(self.titleLabel)
//        self.view.addSubview(self.contentView)
        
        // Add Constraints
//        addConstraintsForTitleLabel()
//        addConstraintsForContentView()
    }
    
//    private func addConstraintsForTitleLabel() {
//        let leading: NSLayoutConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
//        let top: NSLayoutConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 0)
//        let trailing: NSLayoutConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
//        let height: NSLayoutConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.08, constant: 0)
//
//        NSLayoutConstraint.activate([leading, top, trailing, height])
//    }
//
//    private func addConstraintsForContentView() {
//        let leading: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
//        let top: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 0)
//        let trailing: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
//        let bottom: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottomMargin, multiplier: 1, constant: 0)
//
//        NSLayoutConstraint.activate([leading, top, trailing, bottom])
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
