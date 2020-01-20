//
//  SystemList2.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/20/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct SystemList2: View {
    var spacing = 20
    var systemsDataEven = systemsData.filter({ $0.id % 2 == 0 })
    var systemsDataOdd = systemsData.filter({ $0.id % 2 != 0 })
    var body: some View {
        NavigationView {
            
            ScrollView {
                HStack {
                    VStack(spacing: CGFloat(spacing)) {
                        ForEach(systemsDataEven, id: \.id) { system in
                            NavigationLink(destination: SystemView(system: system)
                            ) {
                                ZStack() {
                                    Image(system.views[0].images[0].image).renderingMode(.original).resizable().frame(maxHeight:.infinity).offset(y:-40)
                                    VStack {
                                        Spacer()
                                        VStack {
                                            HStack {
                                                VStack {
                                                    Spacer()
                                                    HStack {
                                                        Image(system.icon).renderingMode(.original)
                                                        .resizable()
                                                        .scaledToFit()
                                                            .frame(width: 15, height: 15)
                                                        Text(system.name)
                                                        .font(.footnote)
                                                            .fontWeight(.medium)
                                                            .foregroundColor(Color.black)
                                                        Spacer()
                                                       
                                                    }
                                                    Spacer()
                                                }
                                                Spacer()
                                            }
                                            .padding(.leading)
                                        }.frame(height:40).background(Color.white)
                                    }.zIndex(2)
                                    
                                }.frame(width: (UIScreen.main.bounds.width*4/5)-40, height: (UIScreen.main.bounds.width*3/4)-40).background(Color.white).cornerRadius(5).clipped().shadow(color: Color.gray.opacity(0.5),radius: 5, y:3)
                            }
                        }
                    }.navigationBarTitle(Text("Body Systems"))
                }.frame(maxWidth:.infinity).padding(.top, 20).padding(.bottom, 50)
            }
        }
    }
}

struct SystemList2_Previews: PreviewProvider {
    static var previews: some View {
        SystemList2()
    }
}
