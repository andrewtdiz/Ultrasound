//
//  SystemViewObject.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import Foundation

struct SystemViewObject : Codable, Hashable, Identifiable {
    
    var id: Int
    var name: String
    var dostring: String
    var optimize: String
    var measure: String
    var type: String
    var systemID: Int
    var images: [SystemImage]
    var system: String
    
}
