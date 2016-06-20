//
//  InitialAnimatedViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/20/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit
import IoniconsSwift
import Hue

class InitialAnimatedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupImage()
        
        
        self.navigationController?.navigationBar.hidden = true
    }
    
    var initialScreenLabel: UILabel = {
        var label = UILabel()
        label = Ionicons.Icecream.label(200)
        label.textColor = accentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setupImage() {
        self.view.addSubview(initialScreenLabel)
        
        let mainViewController = MainViewController()
        
        rotateView(initialScreenLabel)
        
        UIView.animateWithDuration(2, animations: {
         
         self.initialScreenLabel.transform = CGAffineTransformMakeScale(2, 2)
         }) { (true) in
         
         self.navigationController?.pushViewController(mainViewController, animated: true)
         }
        
        
        
        let viewsDictionary = ["initialScreenImage": initialScreenLabel]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[initialScreenImage]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[initialScreenImage]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    
    
    // Rotate <targetView> indefinitely
    private func rotateView(targetView: UIView, duration: Double = 1.0) {
        UIView.animateWithDuration(duration, delay: 0.0, options: .CurveLinear, animations: {
            targetView.transform = CGAffineTransformRotate(targetView.transform, CGFloat(M_PI))
        }) { finished in
            self.rotateView(targetView, duration: duration)
        }
    }
    
}