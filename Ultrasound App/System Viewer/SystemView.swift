//
//  SystemView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct SystemView: View {
    
    var scans: [String]
    var name: String
    var desc: String
    
    @State var scrollState = CGFloat.zero
    @State var containerState = CGFloat.zero
    @State var page = 0
    @State var innerScrolling = false
    @State var startLoc = CGPoint(x:0, y:0)
    var changePageDist = UIScreen.main.bounds.width/4
    var body: some View {
        
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("LAST UPDATED 1 MONTH AGO")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        Spacer()
                    }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width*(7/8))
                    HStack {
                        Text(desc)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .font(.footnote).padding(.top, 10)
                        Spacer()
                    }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width*(7/8))

                }
                Spacer()
            }.padding(.leading, 20.0).offset(x:UIScreen.main.bounds.width/2)

            ScrollView(.horizontal, showsIndicators: false) {
                VStack() {
                
                    ZStack {
                        
                        HStack(spacing: 5) {
                            ForEach(0...scans.count-1, id: \.self) { i in
                                Button(action: {
                                    self.page = i
                                }) {
                                    Text(self.scans[i]).font(.body).foregroundColor(self.page==i ? Color.black : Color.gray).frame(width:60)
                                }
                            }
                        }
                    
                        VStack() {
                            Spacer()
                            HStack {
                                RoundedRectangle(cornerRadius:2).fill(Color.blue).frame(width:60, height: 2).offset(x:tabOffset(page:page, pages: scans.count))
                                    .offset(x:-self.scrollState*(65/UIScreen.main.bounds.width)).shadow(radius: 1, y:1).animation(.spring())
                            }
                        }
                        
                    }.frame(maxHeight: 35)
                    
                }.zIndex(10)
            }.padding(.leading).offset(x:UIScreen.main.bounds.width/2)
            
            Divider().padding(.bottom, 0)
            ZStack() {
                
                HStack(spacing:0) {
                    
                    ForEach(scans, id: \.self) { scan in ScrollView {
                            VStack {
                                ForEach(1...200, id: \.self) { i in
                                    Text(scan).font(.body).foregroundColor(Color.black).frame(width:UIScreen.main.bounds.width).multilineTextAlignment(.leading)
                                
                                }
                            
                            }.frame(width:UIScreen.main.bounds.width)
                        }
                        .frame(minHeight: 0, maxHeight: .infinity)
                    }
                }.frame(width:UIScreen.main.bounds.width*2)

                    .offset(x:calcOffset(page:page, pages: scans.count))
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
                                
                                if(self.page != (self.scans.count-1)) {
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
        }.offset(y:-7).navigationBarTitle(Text(name))
            
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

func tabOffset(page: Int, pages: Int) -> CGFloat {
    if(pages%2==0) {
        return  CGFloat(-35 + (page-((pages/2)-1))*(65))
    } else {
        return CGFloat(page-Int(Double(pages/2) + 0.5))*(65)
    }
    
}

struct SystemView_Previews: PreviewProvider {
    static var previews: some View {
        SystemView(scans: ["Info", "View 1"], name: "Cardiac", desc: "Requires at least 2 of the following 4 views:")
    }
}
