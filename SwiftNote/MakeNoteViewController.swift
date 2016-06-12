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
        
        // Sets background color
        self.view.backgroundColor = UIColor.redColor()
        
        setupNavBar()
        setupTextView()
        
    }
    
    //This sets up the Navigation Bar
    func setupNavBar() {
        
        //Add UINavigation Bar
        let navBar: UINavigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 64))
        let navBarItem = UINavigationItem()
        navBar.items = [navBarItem]
        navBar.delegate = self
        navBar.barTintColor = UIColor.greenColor()

        self.view.addSubview(navBar)
        
        //Add UINavigationItem Title and Prompt
        navBarItem.title = "Jot Down Note"
        navBarItem.prompt = ""
        
        //Add UINavigationItem Left Button ()
        navBarItem.leftBarButtonItem = UIBarButtonItem(title: "", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(MakeNoteViewController.leftNavBarButton))
        
        //Add UINavigationItem Right Button
        navBarItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(MakeNoteViewController.rightNavBarButton))
        
        //This is rudimentary Auto Layout Constraint code. I am still working on it.
        /*
         
        //navBar.translatesAutoresizingMaskIntoConstraints = false

        //Dictionary of Views with just the navBar
        let viewsDictionary = ["navBar": navBar]
        
        //Add navBar constraints
        let navBarConstraintWidth = NSLayoutConstraint.constraintsWithVisualFormat("H:[navBar(44)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let navBarConstraintHeight = NSLayoutConstraint.constraintsWithVisualFormat("V:[navBar(44)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        navBar.addConstraint(navBarConstraintWidth)
        navBar.addConstraint(navBarConstraintHeight)
        */
    }
    
    func setupTextView() {
        
        let textView=UITextView(/*frame:CGRectMake(20, 330, self.view.frame.width-40, 600)*/)
        textView.scrollEnabled=true
        textView.becomeFirstResponder()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textView)
        
        let viewsDictionary = ["textView": textView]
        
        textView.addConstraint(NSLayoutConstraint.constraintsWithVisualFormat("H:[textView(44)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        
        textView.addConstraint(NSLayoutConstraint.constraintsWithVisualFormat("V:[textView(44)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
    }
    
    //This method is called when the left navBar button is pressed.
    func leftNavBarButton() {
    
    }
    
    //This method is called when the right navBar button is pressed.
    func rightNavBarButton() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

}
