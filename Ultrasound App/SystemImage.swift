//
//  SystemImage.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import Foundation

struct SystemImage : Codable, Hashable,  Identifiable {
    var name: String
    var id: Int

    var image: String
    var viewID: Int
    var type: String
    var display: Bool
    
}
