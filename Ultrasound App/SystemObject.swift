//
//  SystemObject.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//
import Foundation

struct SystemObject : Codable, Hashable, Identifiable {
    var name: String
    
    var id: Int
    
    var desc: String
    var views: [SystemViewObject]
    
    var icon: String
    
}
