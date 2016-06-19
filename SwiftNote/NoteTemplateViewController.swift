//
//  NoteTemplateViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/15/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

// This class is a template for making views to view the notes in (both creating notes and viewing/editing notes)
//------------------------------------------------------------
class NoteTemplateViewController: UIViewController, UINavigationBarDelegate, UITextViewDelegate, UIToolbarDelegate {
    
    // Called when view loads. Calls the setupTextView function and stops the view from automatically adjusting the textView insets.
//------------------------------------------------------------
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
        self.automaticallyAdjustsScrollViewInsets = false
        setupTextView()
    }
//------------------------------------------------------------

    
    // Creates UITextView
//------------------------------------------------------------
    let newTextView: UITextView = {
        
        let textView = UITextView()
        textView.scrollEnabled=true
        textView.becomeFirstResponder()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
//------------------------------------------------------------
   
    // This sets up the UITextView
//------------------------------------------------------------
    func setupTextView() {
        
        // Add UITextView
        //------------------------------------------------------------
        newTextView.delegate = self
        self.view.addSubview(newTextView)
        //------------------------------------------------------------

        
        // Add Text View Constrainsts
        //------------------------------------------------------------
        let viewsDictionary = ["newTextView": newTextView]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[newTextView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-94-[newTextView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        //------------------------------------------------------------
    }
//------------------------------------------------------------
    
    // This sets up the UINavibationBar for the 
//------------------------------------------------------------
    func setupNavBar() {
        
        // Add UINavigation Bar
        //------------------------------------------------------------
        let navBar: UINavigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44))
        let navBarItem = UINavigationItem()
        navBar.items = [navBarItem]
        navBar.delegate = self
        //------------------------------------------------------------

        // Add UINavigationItem Title and Prompt
        //------------------------------------------------------------
        navBarItem.prompt = "TTTT"
        navBarItem.title = "Jot Down Note"
        //------------------------------------------------------------
        
        // Add UINavigationItem Left Button ()
        //------------------------------------------------------------
        //navBarItem.leftBarButtonItem = UIBarButtonItem(title: "", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(MakeNoteViewController.leftNavBarButton))
        //------------------------------------------------------------

        // Add UINavigationItem Right Button
        //------------------------------------------------------------
        navBarItem.rightBarButtonItem = UIBarButtonItem(title: "Exit", style:   UIBarButtonItemStyle.Plain, target: self, action: #selector(MakeNoteViewController.rightNavBarButton))
        //------------------------------------------------------------
        
        // Add UINavigationBar
        //------------------------------------------------------------
        self.view.addSubview(navBar)
        //------------------------------------------------------------
    }
//------------------------------------------------------------
    
    // This adds the UIToolBar above the Keyboard and the functions for it's buttons
//------------------------------------------------------------
    
    // This adds the UIToolBar
    //------------------------------------------------------------
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        if newTextView.inputAccessoryView == nil {
            
            newTextView.inputAccessoryView = NoteToolBar.createToolBarWithTarget(self, width: self.view.frame.width)
        }
        
        return true
    }
    //------------------------------------------------------------

    // This function is overridden by the subclassing view controller to provide different save methods
    //------------------------------------------------------------
    func saveNote() {
        
    }
    //------------------------------------------------------------
    
    //This function is overridden by the subclassing view controller to toggle the notes favorite attirbute
    //------------------------------------------------------------
    func favoriteNote() {
    
    }
    //------------------------------------------------------------
    
}
//------------------------------------------------------------
