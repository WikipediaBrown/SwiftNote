//
//  MakeNoteViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class MakeNoteViewController: UIViewController, UINavigationBarDelegate, UITextViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets background color
        self.view.backgroundColor = UIColor.purpleColor()
        
        setupViews()
        
    }
    
    //Add Text View
    let newTextView: UITextView = {
        
        let textView = UITextView()
        textView.scrollEnabled=true
        textView.becomeFirstResponder()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
        
    }()
    
    //This sets up the Navigation Bar and the Text View
    func setupViews() {

        //Add UINavigation Bar
        let navBar: UINavigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44))
        let navBarItem = UINavigationItem()
        navBar.items = [navBarItem]
        navBar.delegate = self
        
        //Add UINavigationItem Title and Prompt
        navBarItem.prompt = "TTTT"
        navBarItem.title = "Jot Down Note"
        
        //Add UINavigationItem Left Button ()
        //navBarItem.leftBarButtonItem = UIBarButtonItem(title: "", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(MakeNoteViewController.leftNavBarButton))
        
        //Add UINavigationItem Right Button
        navBarItem.rightBarButtonItem = UIBarButtonItem(title: "Exit", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(MakeNoteViewController.rightNavBarButton))
        
        //Add views
        self.view.addSubview(navBar)
        self.view.addSubview(newTextView)
        
        //Add Text View Constrainsts
        let viewsDictionary = ["newTextView": newTextView]
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[newTextView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-94-[newTextView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
        
        
    }
    
    //This method is called when the left navBar button is pressed.
    //func leftNavBarButton() {}
    
    //This method is called when the right navBar button is pressed.
    func rightNavBarButton() {
        self.dismissViewControllerAnimated(true) {
            
            self.addNote()
            
            
        }
    }
    
    func addNote() {
        
        if newTextView.text != "" {
            notes.append(newTextView.text)
            NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
        }
    }
    
}
