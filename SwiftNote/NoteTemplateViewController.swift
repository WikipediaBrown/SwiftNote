//
//  NoteTemplateViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/15/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit
import IoniconsSwift
import Hue

// This class is a template for making views to view the notes in (both creating notes and viewing/editing notes)
//------------------------------------------------------------
class NoteTemplateViewController: UIViewController, UINavigationBarDelegate, UITextViewDelegate, UIToolbarDelegate, UITextFieldDelegate {
    
    // Called when view loads. Calls the setupTextView function and stops the view from automatically adjusting the textView insets.
    //------------------------------------------------------------
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        self.automaticallyAdjustsScrollViewInsets = false
        setupTextView()
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIKeyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIKeyboardWillChangeFrameNotification, object: nil)
        
        
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
        
        newTextView.keyboardDismissMode = .Interactive
    }
    //------------------------------------------------------------
    
    
    //------------------------------------------------------------
    func dismissKeyboard() {
        newTextView.resignFirstResponder()
        
    }
    //------------------------------------------------------------
    
    //------------------------------------------------------------
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillChangeFrameNotification, object: self.view.window)
    }
    //------------------------------------------------------------
    
    // Creates UITextView
    //------------------------------------------------------------
    let newTextView: UITextView = {
        
        let textView = UITextView()
        textView.scrollEnabled=true
        textView.textColor = primaryHeaderColor
        textView.font = UIFont.boldSystemFontOfSize(14)
        textView.becomeFirstResponder()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    //------------------------------------------------------------
    
    // Creates UITextField
    //------------------------------------------------------------
    let newTextField: TitleTextField = {
        
        let textField = TitleTextField()
        textField.textColor = secondaryHeaderColor
        textField.backgroundColor = UIColor.whiteColor()
        textField.textAlignment = .Center
        textField.layer.borderColor = secondaryHeaderColor.CGColor
        textField.font = UIFont.boldSystemFontOfSize(45)
        textField.placeholder = "name your note"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        
        // Add UITextField
        //------------------------------------------------------------
        newTextField.delegate = self
        self.view.addSubview(newTextField)
        //------------------------------------------------------------
        
        // Add Text View Constrainsts
        //------------------------------------------------------------
        let viewsDictionary = ["newTextView": newTextView, "newTextField": newTextField]
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[newTextView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[newTextField]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-67-[newTextField]-[newTextView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        //------------------------------------------------------------
    }
    //------------------------------------------------------------
    
    // This sets up the UINavibationBar for the
    //------------------------------------------------------------
    func setupNavBar() {
        
        // Add UINavigation Bar
        //------------------------------------------------------------
        let navBar: UINavigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.frame.size.width, 64))
        let navBarItem = UINavigationItem()
        navBar.items = [navBarItem]
        navBar.delegate = self
        //------------------------------------------------------------
        
        // Add UINavigationItem Title and Prompt
        //------------------------------------------------------------
        //navBarItem.prompt = ""
        navBarItem.title = "Create Note"
        //------------------------------------------------------------
        
        // Add UINavigationItem Left Button ()
        //------------------------------------------------------------
        //navBarItem.leftBarButtonItem = UIBarButtonItem(image: Ionicons.IosCloseOutline.image(35), style: .Plain, target: self, action: #selector(MakeNoteViewController.leftNavBarButton))
        //------------------------------------------------------------
        
        // Add UINavigationItem Right Button
        //------------------------------------------------------------
        navBarItem.rightBarButtonItem = UIBarButtonItem(image: Ionicons.IosCloseOutline.image(35), style: .Plain, target: self, action: #selector(MakeNoteViewController.rightNavBarButton))
        //------------------------------------------------------------
        
        // Add UINavigationBar
        //------------------------------------------------------------
        self.view.addSubview(navBar)
        //------------------------------------------------------------
    }
    //------------------------------------------------------------
    
    // This adds the UIToolBar above the Keyboard and the functions for it's buttons
    //------------------------------------------------------------
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        newTextView.inputAccessoryView = NoteToolBar.createToolBarWithTarget(self, width: self.view.frame.width, favorited: isFav, characters: characterCount(newTextView))
        return true
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        newTextField.inputAccessoryView = NoteToolBar.createToolBarWithTarget(self, width: self.view.frame.width, favorited: isFav, characters: characterCount(newTextView))
        return true
    }
    //------------------------------------------------------------
    
    // This function is overridden by the subclassing view controller to provide different save methods
    //------------------------------------------------------------
    func saveNote() {
        
    }
    //------------------------------------------------------------
    
    // This sets the favorited image in the tool bar.
    //------------------------------------------------------------
    var isFav = false
    func favoriteNote(sender: UIBarButtonItem) {
        isFav = !isFav
        
        if isFav {
            
            sender.image = Ionicons.IosHeart.image(35)
        } else {
            
            sender.image = Ionicons.IosHeartOutline.image(35)
        }
    }
    //------------------------------------------------------------
   
    // This section is resposible for updating the character count in the tool bar.
    //------------------------------------------------------------
    func textViewDidChange(textView: UITextView) {
        if newTextView.text != " " {
            
            characterCount(textView)
        }
    }
    func characterCount(textView: UITextView) -> Int {
        let textWithoutSpace = textView.text.stringByReplacingOccurrencesOfString("", withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        let count = textWithoutSpace.characters.count
        NoteToolBar.characterCount.title = "\(count) characters"
        return count
    }
    //------------------------------------------------------------

    // This method updates the header text in the main table view.
    //------------------------------------------------------------
    func headerText() {
        
        noteCount.text = "You've got \(notes!.count) notes saved"
    }
    //------------------------------------------------------------
    
    // This sets the cursor above the keyboard and below the top of the visible section of the view.
    //------------------------------------------------------------
    func adjustForKeyboard(notification: NSNotification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let keyboardViewEndFrame = view.convertRect(keyboardScreenEndFrame, fromView: view.window)
        if notification.name == UIKeyboardWillHideNotification {
            
            newTextView.contentInset = UIEdgeInsetsZero
        } else {
            
            newTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
    }
    //------------------------------------------------------------
}
//------------------------------------------------------------
