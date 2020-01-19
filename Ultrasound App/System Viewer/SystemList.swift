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
                HStack {
                    NavigationLink(destination: SystemView(scans: ["PSL", "PSS", "A4C", "SXP"], name: "Cardiac", desc: "Requires at least 2 of the following 4 views:")) {
                        VStack() {
                            Image(systemName: "heart.fill").foregroundColor(Color.white)
                            Text("Cardiac")
                                .font(.headline)
                                .foregroundColor(Color.white)
                            
                        }.frame(width: (UIScreen.main.bounds.width/2)-10, height: (UIScreen.main.bounds.width/2)-10).background(Color.blue).cornerRadius(5).clipped().shadow(color: Color.gray.opacity(0.5),radius: 5, y:3)
                    }
                    .padding(.top)
                    NavigationLink(destination: SystemView(scans: ["NRML", "Detach", "OptN"], name: "Ocular", desc:"Orthogonal stills or video showing area of interest.\nUse ocular settings when available.")) {
                        VStack() {
                            Image(systemName: "eye.fill").foregroundColor(Color.white)
                            Text("Ocular")
                                .font(.headline)
                                .foregroundColor(Color.white)
                            
                        }.frame(width: (UIScreen.main.bounds.width/2)-10, height: (UIScreen.main.bounds.width/2)-10).background(Color.orange).cornerRadius(5).clipped().shadow(color: Color.gray.opacity(0.5),radius: 5, y:3)
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
                Spacer()
            }.navigationBarTitle(Text("Body Systems"))
        }
        
    }
}


struct SystemList_Previews: PreviewProvider {
    static var previews: some View {
        SystemList()
    }
}


