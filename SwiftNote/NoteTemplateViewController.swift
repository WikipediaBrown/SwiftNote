//
//  NoteTemplateViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/15/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class NoteTemplateViewController: UIViewController, UINavigationBarDelegate, UITextViewDelegate, UIToolbarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let newTextView: UITextView = {
        
        let textView = UITextView()
        textView.scrollEnabled=true
        textView.becomeFirstResponder()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
        
    }()

    //This sets up the Navigation Bar and the Text View
    func setupViews() {
        
        //Add views
        self.view.addSubview(newTextView)
        
        //Add Text View Constrainsts
        let viewsDictionary = ["newTextView": newTextView]
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[newTextView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-94-[newTextView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func setupNavBar() {
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
        
        self.view.addSubview(navBar)
    }
}
