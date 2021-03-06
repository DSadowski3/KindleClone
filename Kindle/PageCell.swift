//
//  PageCell.swift
//  Kindle
//
//  Created by Dominik Sadowski on 2/3/17.
//  Copyright © 2017 Dominik Sadowski. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Some text Some text Some text Some text Some text Some text Some text Some text Some text Some text v v Some text Some text Some text Some text Some text Some text Some text Some text v"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
