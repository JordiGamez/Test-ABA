//
//  RowCell.swift
//  Test ABA
//
//  Created by Jordi Gamez on 26/2/17.
//  Copyright © 2017 Jordi Gamez. All rights reserved.
//

import UIKit

class RowCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle:UILabel!
    @IBOutlet weak var cellDescription:UILabel!
    @IBOutlet weak var cellImage:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        self.preservesSuperviewLayoutMargins = false
        self.selectionStyle = .none
        self.layoutIfNeeded()
        
        if (cellImage.image == nil) {
            let image: UIImage = UIImage(named: "noimage.png")!
            cellImage.image = image
        }
    }
}
