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
        
        setupNavBar()
        
        
    }
    
    //This sets up the Navigation Bar
    func setupNavBar() {
        
        //Add UINavigation Bar
        let navBar: UINavigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 64))
        let navBarItem = UINavigationItem()
        navBar.items = [navBarItem]
        navBar.delegate = self
        self.view.addSubview(navBar)
        
        navBar.backgroundColor = UIColor.whiteColor()
        
        //Add UINavigationItem Title and Prompt
        navBarItem.title = ""
        navBarItem.prompt = ""
        
        //Add UINavigationItem Left Button ()
        navBarItem.leftBarButtonItem = UIBarButtonItem(title: "Save", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(MakeNoteViewController.leftNavBarButton))
        
        //Add UINavigationItem Right Button
        navBarItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(MakeNoteViewController.rightNavBarButton))


        
    }
    
    func leftNavBarButton() {
    
    }
    
    func rightNavBarButton() {
    
    }

}
