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
    var third: [SystemObject]
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
                                    .frame(width: 30, height: 30).offset(y:-10)
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
                                
                            }.frame(width: (UIScreen.main.bounds.width/3)-40, height: (UIScreen.main.bounds.width/3)-40).background(Color.white).cornerRadius(5).clipped().shadow(color: Color.gray.opacity(0.5),radius: 5, y:3)
                        }
                    }
                    Spacer()
                }
                Spacer().frame(width: CGFloat(spacing))
                VStack(spacing: CGFloat(spacing)) {
                    ForEach(odd, id: \.id) { system in
                        NavigationLink(destination: SystemView(system: system)
                        ) {
                            ZStack() {
                                Image(system.icon).renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                    .frame(width: 30, height: 30).offset(y:-10)
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
                                
                            }.frame(width: (UIScreen.main.bounds.width/3)-40, height: (UIScreen.main.bounds.width/3)-40).background(Color.white).cornerRadius(5).clipped().shadow(color: Color.gray.opacity(0.5),radius: 5, y:3)
                        }
                        
                    }
                    Spacer()
                }.navigationBarTitle(Text("Applications"))
                Spacer().frame(width: CGFloat(spacing))
                VStack(spacing: CGFloat(spacing)) {
                                   ForEach(third, id: \.id) { system in
                                       NavigationLink(destination: SystemView(system: system)
                                       ) {
                                           ZStack() {
                                               Image(system.icon).renderingMode(.original)
                                               .resizable()
                                               .scaledToFit()
                                                   .frame(width: 30, height: 30).offset(y:-10)
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
                                               
                                           }.frame(width: (UIScreen.main.bounds.width/3)-40, height: (UIScreen.main.bounds.width/3)-40).background(Color.white).cornerRadius(5).clipped().shadow(color: Color.gray.opacity(0.5),radius: 5, y:3)
                                       }
                                       
                                   }
                            Spacer()
                    
                }.navigationBarTitle(Text("Applications"))
            }.frame(maxWidth:.infinity).padding(.top, 20).padding(.bottom, 50)
        }
    }
}

struct TileList_Previews: PreviewProvider {
    static var previews: some View {
        TileList(even: systemsData.filter({ $0.id % 3 == 0 }), odd: systemsData.filter({ $0.id % 3 == 1 }), third: systemsData.filter({ $0.id % 3 == 2}), spacing: 20)
    }
}
