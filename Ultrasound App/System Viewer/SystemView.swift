//
//  SystemView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct SystemView: View {
    
    var system: SystemObject
    var tabWidth = 60
    var offst = 5
    
    @State var scrollState = CGFloat.zero
    @State var containerState = CGFloat.zero
    @State var page = 0
    @State var innerScrolling = false
    @State var startLoc = CGPoint(x:0, y:0)
    var changePageDist = UIScreen.main.bounds.width/4
    var body: some View {
        
        ScrollView {
            VStack {
                VStack() {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("LAST UPDATED " + self.system.updated.uppercased())
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                                Spacer()
                                Image(system.icon).resizable()
                                .scaledToFit().frame(width:30, height:30).offset(y:-35)
                            }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width*(7/8))
                            HStack {
                                Text(self.system.desc)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(nil)
                                    .font(.footnote).padding(.top, 5)
                                Spacer()
                            }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width*(7/8)).padding(.top, -10)

                        }
                        Spacer()
                    }.padding(.leading, 20).offset(x:UIScreen.main.bounds.width/2)

                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack() {
                        
                            ZStack {
                                
                                HStack(spacing: CGFloat(offst)) {
                                    ForEach(0...self.system.views.count-1, id: \.self) { i in
                                        Button(action: {
                                            self.page = i
                                        }) {
                                            Text(self.system.views[i].shortened).font(.body).foregroundColor(self.page==i ? Color.black : Color.gray).frame(width: CGFloat(self.tabWidth))
                                        }
                                    }
                                }
                            
                                VStack() {
                                    Spacer()
                                    HStack {
                                        RoundedRectangle(cornerRadius:2).fill(Color.blue).frame(width: CGFloat(tabWidth), height: 2).offset(x:tabOffset(page:page, pages: system.views.count, tabWidth: tabWidth, offst: offst))
                                            .offset(x:-self.scrollState*(CGFloat(self.tabWidth+self.offst)/UIScreen.main.bounds.width)).shadow(radius: 1, y:1).animation(.spring())
                                    }
                                }
                                
                            }.frame(maxHeight: 35)
                            
                        }.zIndex(10)
                    }.padding(.horizontal).offset(x:UIScreen.main.bounds.width/2).animation(.none)
                    
                    Divider().padding(.vertical, -8.0)
                }
                ZStack() {
                    
                    HStack(spacing:0) {
                        
                        ForEach(system.views, id: \.self) { scan in ScrollView {
                                VStack {
                                    HStack(){
                                        Text(scan.name)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            Spacer()
                                    }
                                    HStack(){
                                        Text(scan.desc).font(.caption).fontWeight(.regular).foregroundColor(Color.black.opacity(0.7))
                                            Spacer()
                                    }
                                   
                                    if (!scan.images.isEmpty) {
                                        VStack() { Image(scan.images[0].image).resizable().scaledToFit().cornerRadius(3).frame(width: UIScreen.main.bounds.width*4/5)
                                            Text(scan.images[0].desc).font(.caption).fontWeight(.regular).foregroundColor(Color.black.opacity(0.7))
                                            
                                        }.frame(width: UIScreen.main.bounds.width*4/5).padding(.vertical)
                                    }
                                   
                                Spacer()
                                }.padding(.horizontal).padding(.top, 15).padding(.bottom, 500).frame(width:UIScreen.main.bounds.width)
                        }.offset(y:-15)
                            .frame(minHeight: 0).frame(maxHeight: UIScreen.main.bounds.height*(0.7))
                        }
                    }.frame(width:UIScreen.main.bounds.width*2)

                        .offset(x:calcOffset(page:page, pages: system.views.count))
                        .offset(x:innerScrolling==true ? scrollState : CGFloat.zero)
                        
                    
                }.background(Color.white)
                    .animation(.spring())
                        .gesture(
                            DragGesture()
                            .onChanged { value in
                                if(Int(value.startLocation.x) > 215) {
                                    self.startLoc = value.startLocation
                                    self.innerScrolling = true
                                    self.scrollState = value.translation.width
                                }
                               
                                
                               
                            }
                            .onEnded { value in
                                if((self.scrollState < -1*self.changePageDist)) {
                                    
                                    if(self.page != (self.system.views.count-1)) {
                                        self.page = self.page + 1
                                    }
                                    
                                } else if(self.scrollState > self.changePageDist) {
                                    
                                    if(self.page != 0) {
                                        self.page = self.page - 1
                                    }
                                }
                                
                                self.scrollState = 0
                                self.innerScrolling = false
                            }
                )
            }.offset(y:-7).navigationBarTitle(Text(system.name))
        }
            
    }
    }


func calcOffset(page: Int, pages: Int) -> CGFloat {
    if(pages%2==0) {
        let first = UIScreen.main.bounds.width/2
        let secondOne = UIScreen.main.bounds.width
        let secondTwo = CGFloat(page - ((pages/2)-1))
        return CGFloat(first - (secondOne * secondTwo))
    } else {
        let first = -UIScreen.main.bounds.width
        let secondOne = CGFloat(page-Int(Double(pages/2) + 0.5))
        return CGFloat(first*secondOne)
    }
    
}

func tabOffset(page: Int, pages: Int, tabWidth: Int, offst: Int) -> CGFloat {
    if(pages%2==0) {
        let first = -1*CGFloat(tabWidth/2 + offst)
        let second = (CGFloat(page-((pages/2)-1)))*CGFloat(tabWidth + offst)
        return  CGFloat(first + second)
    } else {
        return CGFloat(page-Int(Double(pages/2) + 0.5))*CGFloat((tabWidth + offst))
    }
    
}

struct SystemView_Previews: PreviewProvider {
    static var previews: some View {
        SystemView(system: systemsData[0])
    }
}
