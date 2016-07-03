//
//  InitialAnimatedViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/20/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit
import IoniconsSwift
// This is the animation for the initial s
//------------------------------------------------------------
class InitialAnimatedViewController: UIViewController {
    
    // This calls the setupImage function and hides the navigation bar.
    //------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImage()
        self.navigationController?.navigationBar.hidden = true
    }
    //------------------------------------------------------------
    
    // This creates the image to be animated.
    //------------------------------------------------------------
    var initialScreenLabel: UILabel = {
        var label = UILabel()
        label = Ionicons.Icecream.label(200)
        label.textColor = accentColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    //------------------------------------------------------------
    
    // This sets up the image and its animation then pushes the main view controller onto the stack.
    //------------------------------------------------------------
    func setupImage() {

        self.view.addSubview(initialScreenLabel)
        let mainViewController = MainViewController()
        UIView.animateWithDuration(2, delay: 0, options: .CurveEaseIn, animations: {
            self.initialScreenLabel.transform = CGAffineTransformMakeScale(2, 2)
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            self.rotateView()
            }) { (true) in
                
                self.navigationController?.pushViewController(mainViewController, animated: true)
        }
        let viewsDictionary = ["initialScreenImage": initialScreenLabel]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[initialScreenImage]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[initialScreenImage]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    //------------------------------------------------------------
    
    // This funciton rotates the image 20% of a circle.
    //------------------------------------------------------------
    func rotateView() {
    
        self.initialScreenLabel.transform = CGAffineTransformRotate(self.initialScreenLabel.transform, CGFloat((M_PI/5)))
    }
    //------------------------------------------------------------
    
}
