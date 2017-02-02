//
//  BookCell.swift
//  Kindle
//
//  Created by Dominik Sadowski on 2/2/17.
//  Copyright © 2017 Dominik Sadowski. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
