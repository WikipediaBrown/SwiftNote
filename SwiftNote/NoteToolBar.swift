//
//  Helper.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/16/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import Foundation
import UIKit
import IoniconsSwift
import Hue

struct NoteToolBar {
    
    static let characterCount = UIBarButtonItem()
    
    static func createToolBarWithTarget(target: AnyObject, width: CGFloat, favorited: Bool, characters: Int) -> UIToolbar {
        
        let toolBar = UIToolbar(frame: CGRectMake(0, 0, width, 44))
        
        
        
        characterCount.title = "\(characters)"
        characterCount.tintColor = primaryHeaderColor
        
        var favImage = Ionicons.IosHeartOutline.image(35, color: primaryHeaderColor)
        if favorited {
            
            favImage = Ionicons.IosHeart.image(35, color: primaryHeaderColor)
        }
        let favoriteButton = UIBarButtonItem(image: favImage, style: .Plain, target: target, action: #selector(NoteTemplateViewController.favoriteNote))
 
        favoriteButton.tintColor = secondaryHeaderColor
        
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        
        
        
        let saveButton = UIBarButtonItem(title: "Save", style: .Plain, target: target, action: #selector(NoteTemplateViewController.saveNote))
        saveButton.tintColor = primaryHeaderColor
        toolBar.items = [favoriteButton, characterCount, spacer, saveButton]
        
        
        
        return toolBar
    }
}