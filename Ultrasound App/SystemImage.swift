//
//  SystemImage.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import Foundation

struct SystemImage : Codable, Hashable,  Identifiable {
    var id: Int

    var name: String
    var image: String
    var viewID: Int
    var desc: String
    var offset: Int
    
    
}
