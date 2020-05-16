//
//  SystemListed.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct SystemListed: View {
    
    @Binding var data: Int
    
    @Binding var selection: Bool
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
            }.navigationBarTitle(Text("Applications"))
        .navigationBarItems(trailing:
            Button(action: {self.selection = true
                print("Yea i changed it")
            }){
                Image(systemName: "gear")
                    .scaleEffect(3/2)
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.gray)
            }
        )
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
struct SystemListed_Previews: PreviewProvider {
    @State static var data1 = 0
    @State static var data2 = false
    static var previews: some View {
        SystemListed(data: $data1,selection: $data2)
    }
}
