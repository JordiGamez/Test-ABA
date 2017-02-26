//
//  ItemViewController.swift
//  Test ABA
//
//  Created by Jordi Gamez on 26/2/17.
//  Copyright © 2017 Jordi Gamez. All rights reserved.
//

import UIKit
import Kingfisher

class ItemViewController: UIViewController {
    
    @IBOutlet weak var cellTitle:UILabel!
    @IBOutlet weak var cellDescription:UILabel!
    @IBOutlet weak var cellImage:UIImageView!
    
    var itemTitle: String = ""
    var itemDescription: String = ""
    var itemImage: String = ""
    
    var noImage: String = "noimage.png"
    var noImageBig: String = "noimage.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show item title in the navigation
        title = itemTitle
        
        // Show item title
        cellTitle.text = itemTitle
        
        // Show item description
        cellDescription.text = itemDescription
        
        // Show item image
        if (itemImage != noImage) {
            let imageURL = URL(string: itemImage)
            cellImage.kf.setImage(with: imageURL)
            
            // If the image is nil (a website or a wrong url)
            if (cellImage.image == nil) {
                let image = Image(named: noImageBig)
                cellImage.image = image
            }
        } else {
            let image = Image(named: noImageBig)
            cellImage.image = image
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
