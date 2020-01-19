//
//  SystemImage.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import Foundation
import SwiftUI

class SystemImage {
    var name: String
    var image: String
    var desc: String
    
    
    init(name: String, image:String, desc: String) {
        self.name = name
        self.image = image
        self.desc = desc
    }
}
