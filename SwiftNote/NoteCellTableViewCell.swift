//
//  NoteCellTableViewCell.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class NoteCellTableViewCell: UITableViewCell {
    
    var mainViewController: MainViewController?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cellid")
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let noteLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Note"
        label.font = UIFont.boldSystemFontOfSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(type: .Custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "heart-empty"), forState: UIControlState.Normal)
        
        return button
        
    }()
    
    func setupViews() {
        addSubview(noteLabel)
        addSubview(actionButton)
        
        actionButton.addTarget(self, action: #selector(NoteCellTableViewCell.handleAction), forControlEvents: .TouchUpInside)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-16-[v0]-8-[v1(80)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": noteLabel, "v1": actionButton]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": noteLabel]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": actionButton]))
    }
    
    func handleAction() {
        mainViewController?.favoriteNote(self)
        
        if actionButton.currentImage == UIImage(named: "heart-empty") {
        
            actionButton.setImage(UIImage(named: "heart-full"), forState: UIControlState.Normal)
        } else {
        
            actionButton.setImage(UIImage(named: "heart-empty"), forState: UIControlState.Normal)
        }
        
    }
}
