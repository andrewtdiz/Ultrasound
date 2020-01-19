//
//  SystemObject.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

class SystemObject {
    var name: String
    var image: String
    var desc: String
    var views: [SystemViewObject]
    var updated: String
    
    init(name: String, image: String, desc: String, views: [SystemViewObject], updated: String) {
        self.name = name
        self.image = image
        self.desc = desc
        self.views = views
        self.updated = updated
    }
}
