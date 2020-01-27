//
//  TileList.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/27/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct TileList: View {
    var even: [SystemObject]
    var odd: [SystemObject]
    var spacing: Int
    var body: some View {
        ScrollView {
            HStack {
                VStack(spacing: CGFloat(spacing)) {
                    ForEach(even, id: \.id) { system in
                        NavigationLink(destination: SystemView(system: system)
                        ) {
                            ZStack() {
                                Image(system.icon).renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                    .frame(width: 50, height: 50).offset(y:-10)
                                Spacer()
                                VStack {
                                    Spacer()
                                    VStack {
                                        HStack {
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    Spacer()
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
                                
                            }.frame(width: (UIScreen.main.bounds.width/2)-40, height: (UIScreen.main.bounds.width/2)-40).background(Color.white).cornerRadius(5).clipped().shadow(color: Color.gray.opacity(0.5),radius: 5, y:3)
                        }
                    }
                }.navigationBarTitle(Text("Body Systems"))
                Spacer().frame(width: CGFloat(spacing))
                VStack(spacing: CGFloat(spacing)) {
                    ForEach(odd, id: \.id) { system in
                        NavigationLink(destination: SystemView(system: system)
                        ) {
                            ZStack() {
                                Image(system.icon).renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                    .frame(width: 50, height: 50).offset(y:-10)
                                Spacer()
                                VStack {
                                    Spacer()
                                    VStack {
                                        HStack {
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    Spacer()
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
                                }
                                
                            }.frame(width: (UIScreen.main.bounds.width/2)-40, height: (UIScreen.main.bounds.width/2)-40).background(Color.white).cornerRadius(5).clipped().shadow(color: Color.gray.opacity(0.5),radius: 5, y:3)
                        }
                        
                    }
                }.navigationBarTitle(Text("Applications"))
            }.frame(maxWidth:.infinity).padding(.top, 20).padding(.bottom, 50)
        }
    }
}

struct TileList_Previews: PreviewProvider {
    static var previews: some View {
        TileList(even: systemsData.filter({ $0.id % 2 == 0 }), odd: systemsData.filter({ $0.id % 2 != 0 }), spacing: 20)
    }
}
