//
//  MakeNoteViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class MakeNoteViewController: UIViewController, UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Sets background color
        self.view.backgroundColor = UIColor.redColor()
        
        //Add UINavigation Bar
        let navBar: UINavigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 88))
        navBar.delegate = self
        self.view.addSubview(navBar)
        navBar.backgroundColor = UIColor.whiteColor()
        
    }

}
