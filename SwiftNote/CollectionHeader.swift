//
//  Header.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit
import Realm

var noteCount = UILabel()


class CollectionHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let collectionHeader: UILabel = {
        noteCount.text = "You've got \(notes!.count) notes saved"
        noteCount.font = UIFont.boldSystemFontOfSize(14)
        noteCount.textColor = primaryHeaderColor
        noteCount.translatesAutoresizingMaskIntoConstraints = false
        return noteCount
        
    }()
    
    
    func setupViews() {
        
        addSubview(collectionHeader)
        contentView.backgroundColor = accentColor
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collectionHeader]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collectionHeader]))
    }
}
