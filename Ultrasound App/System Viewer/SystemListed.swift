//
//  SystemListed.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct SystemListed: View {
    
    var body: some View {
        NavigationView {
            List(systemsData) { system in
                NavigationLink(destination: SystemView(system:system)) {
                    HStack() {
                        Image(system.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        Text(system.name)
                            .font(.body)
                            .padding(.leading)
                    }.frame(maxHeight: 40)
                }
            }.navigationBarTitle(Text("Body Systems"))
        
        }
    }
}
struct SystemListed_Previews: PreviewProvider {
    static var previews: some View {
        SystemListed()
    }
}
