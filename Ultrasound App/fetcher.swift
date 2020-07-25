//
//  fetcher.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import Foundation

var systemsData = combineSysAndViews(viewsData: load("SystemViews.JSON"), systemsData:load("SystemObjects.JSON"), systemsImages:load("SystemImages.JSON"))
var institutionData = Institution(id: 0, name: "Jackson Memorial", requirements: ["Number needed to graduate: 250 scans.", "Numbers per JMH adult/pediatric ED rotation: 10.", "Educational scans: Upload to Q-path.", "Direct patient care scans: Upload to PACS and Q-path.", "US machines capable of PACS/Q-path upload:", "JMH Adult ED, JMH Pediatric ED, Ryder Trauma Center."], credentialing: ["Number per US application: 25 scans.", "Number of HIMAP/RUSH and Triple Scan: 10 scans each.", "Total procedural scans: 5. "], systemsData: systemsData)


func load<T:Decodable>(_ filename:String, as type:T.Type = T.self) -> T {
    // reading the JSON of events
    let data:Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
        
    do {
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    } catch {
        print(filename)
        fatalError("Couldn't parse \(filename) as\(T.self):\(error)")
    }
}


func combineSysAndViews(viewsData:[SystemViewObject] , systemsData:[SystemObject], systemsImages:[SystemImage]) -> [SystemObject] {
    var systemsCopy = systemsData
    var viewsCopy = viewsData
    
    for i in 0..<systemsImages.count {
        for j in 0..<viewsCopy.count {
            if (viewsCopy[j].id == systemsImages[i].viewID) {
                viewsCopy[j].images.append(systemsImages[i])
            }
        }
    }
    
    for i in 0..<viewsCopy.count {
        let hold = viewsCopy[i].systemID
        for j in 0..<systemsCopy.count {
            if (systemsCopy[j].id == hold) {
                systemsCopy[j].views.append(viewsCopy[i])
            }
        }
    }
    systemsCopy = systemsCopy.sorted(by: {$0.name < $1.name})
    return systemsCopy
    
}





//{
//    "id": 1,
//    "name": "Biliary",
//    "image": "",
//    "desc": "Are there gallstones? Signs of biliary inflammation?\nGallbladder can be a sweep-through or two still images.\nMeasure anterior wall.",
//    "views": [],
//    "updated": "one week ago",
//    "icon" : "biliaryIcon",
//},
