//
//  SystemList.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct SystemList: View {
    
    var body: some View {
        NavigationView {
            
            VStack {
                ForEach(systemsData, id: \.id) { system in
                    NavigationLink(destination: SystemView(system: system)
                    ) {
                        VStack() {
                            Image(systemName: system.image).foregroundColor(Color.white)
                            Text(system.name)
                                .font(.headline)
                                .foregroundColor(Color.white)
                            
                        }.frame(width: (UIScreen.main.bounds.width/2)-10, height: (UIScreen.main.bounds.width/2)-10).background(Color.blue).cornerRadius(5).clipped().shadow(color: Color.gray.opacity(0.5),radius: 5, y:3)
                    }
                    .padding(.top)
                }
                
                Spacer()
            }.padding(.horizontal).navigationBarTitle(Text("Body Systems"))
        }
    }
        
}


struct SystemList_Previews: PreviewProvider {
    static var previews: some View {
        SystemList()
    }
}


