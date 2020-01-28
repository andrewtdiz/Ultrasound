//
//  SystemList.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct SystemList: View {
    var spacing = 20
     var systemsDataEven = systemsData.filter({ $0.id % 3 == 0 })
     var systemsDataOdd = systemsData.filter({ $0.id % 3 == 1 })
    var systemsDataThird = systemsData.filter({ $0.id % 3 == 2 })
    
     var body: some View {
        NavigationView {
            
            TileList(even: systemsDataEven, odd: systemsDataOdd, third: systemsDataThird, spacing: spacing)
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
        
}


struct SystemList_Previews: PreviewProvider {
    static var previews: some View {
        SystemList()
    }
}


