//
//  Institution.swift
//  Ultrasound App
//
//  Created by DiZenzo on 7/24/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import Foundation

struct Institution : Codable, Hashable, Identifiable {
    
    var id: Int
    var name: String
    var requirements: [String]
    var credentialing: [String]
    var systemsData: [SystemObject]    
    
}
