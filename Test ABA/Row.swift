//
//  Cell.swift
//  Test ABA
//
//  Created by Jordi Gamez on 26/2/17.
//  Copyright © 2017 Jordi Gamez. All rights reserved.
//

import Foundation

// Row class
class Row {
    var title: String? = ""
    var description: String? = ""
    var image: String? = ""
    
    init(title: String, description: String, image: String) {
        self.title = title
        self.description = description
        self.image = image
    }
}
