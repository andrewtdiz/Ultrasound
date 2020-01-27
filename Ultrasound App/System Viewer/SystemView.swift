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
                                    .font(.footnote).padding(.top, 5).fixedSize(horizontal: false, vertical: true)
                                Spacer()
                            }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width*(7/8)).padding(.top, -10)

                        }
                        Spacer()
                    }.padding(.leading, 20)
                    

                    
                    Divider().padding(.vertical, 0)
                }
                ZStack() {
                    
                    VStack(spacing:10) {
                        
                        ForEach(system.views, id: \.self) { scan in
                            link(label: scan.name, destination: ScanView(scan:scan))
                        }
                    }.padding()
                        
                    
                }.frame(maxWidth: UIScreen.main.bounds.width).background(Color.white)
                    
            }.offset(y:-7).navigationBarTitle(Text(system.name))

            
        
    }
    
}

func link<Destination: View>(label: String, destination: Destination) -> some View {
    return NavigationLink(destination: destination) {
        HStack {
            Text(label).font(.headline).fontWeight(.semibold)
            Spacer()
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
