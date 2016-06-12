//
//  MakeNoteViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class MakeNoteViewController: UIViewController, UINavigationBarDelegate, UITextViewDelegate {
    
    var note = ""

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
        let navBar: UINavigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44))
        let navBarItem = UINavigationItem()
        navBar.items = [navBarItem]
        navBar.delegate = self
        navBar.barTintColor = UIColor.greenColor()

        self.view.addSubview(navBar)
        
        //Add UINavigationItem Title and Prompt
        navBarItem.prompt = "TTTT"
        navBarItem.title = "Jot Down Note"
        
        //Add UINavigationItem Left Button ()
        //navBarItem.leftBarButtonItem = UIBarButtonItem(title: "", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(MakeNoteViewController.leftNavBarButton))
        
        //Add UINavigationItem Right Button
        navBarItem.rightBarButtonItem = UIBarButtonItem(title: "Exit", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(MakeNoteViewController.rightNavBarButton))
        
        //This is rudimentary Auto Layout Constraint code. I am still working on it.
        //navBar.translatesAutoresizingMaskIntoConstraints = false

        //Dictionary of Views with just the navBar
        //let viewsDictionary = ["navBar": navBar]
        
        //Add navBar constraints
        
        //self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[navBar]", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
    //This sets up the Text View
    func setupTextView() {
        
        //Add Text View
        let textView = UITextView()
        textView.scrollEnabled=true
        textView.becomeFirstResponder()
        textView.delegate = self
        
        self.view.addSubview(textView)
        
        //Add Text View Constrainsts
        let viewsDictionary = ["textView": textView]
        textView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[textView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-94-[textView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    //This method is called when the left navBar button is pressed.
    //func leftNavBarButton() {}
    
    //This method is called when the right navBar button is pressed.
    func rightNavBarButton() {
        self.dismissViewControllerAnimated(true) { 
            self.saveTextView()
        }
        
    }
    
    func saveTextView() {
        notes.append(note)
        
    }

}
