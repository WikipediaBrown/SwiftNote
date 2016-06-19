//
//  NotesData.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/12/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import Foundation
import RealmSwift

class noteData: Object {
    
    dynamic var note = ""
    dynamic var favorited = false
    dynamic var createdTime = NSDate()
    dynamic var lastEdited = NSDate()
}


let realm = try! Realm()

var notes: Results<noteData>?
