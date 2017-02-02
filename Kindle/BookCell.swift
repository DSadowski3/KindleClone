//
//  BookCell.swift
//  Kindle
//
//  Created by Dominik Sadowski on 2/2/17.
//  Copyright © 2017 Dominik Sadowski. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the text"
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "This authors name"
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(coverImageView)
        addSubview(titleLabel)
        addSubview(authorLabel)
        
        coverImageView.frame = CGRect(x: 8, y: 8, width: 50, height: 64)
        titleLabel.frame = CGRect(x: 66, y: 20, width: 200, height: 20)
        authorLabel.frame = CGRect(x: 66, y: 48, width: 200, height: 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
