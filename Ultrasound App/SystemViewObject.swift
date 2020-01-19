//
//  SystemViewObject.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import Foundation
import SwiftUI

class SystemViewObject {
    var name: String
    var shortened: String
    var desc: String
    var images: [SystemImage]
    
    init(name: String, shortened: String, desc: String, images: [SystemImage]) {
        self.name = name
        self.shortened = shortened
        self.desc = desc
        self.images = images
        
        
    }
}
