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
import Walker

class InitialAnimatedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBackground()
        setupImage()
    }
    
    var initialScreenLabel: UILabel = {
        var label = UILabel()
        label = Ionicons.Icecream.label(200)
        label.textColor = UIColor.whiteColor()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    func setupBackground() {
        
        self.navigationController!.navigationBar.hidden = true
    }
    
    func setupImage() {
        self.view.addSubview(initialScreenLabel)
        
        animate(initialScreenLabel) { (<#Ingredient#>) in
            <#code#>
        }
        
        
        let viewsDictionary = ["initialScreenImage": initialScreenLabel]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[initialScreenImage]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[initialScreenImage]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
        
        //let mainViewController = MainViewController()
        //self.presentViewController(mainViewController, animated: true, completion: nil)
    }

}
