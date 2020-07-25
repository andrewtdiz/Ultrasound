//
//  SystemView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI
import Firebase

struct SystemView: View {
    
    var systemID:Int
    var tabWidth = 60
    var offst = 5
    
    @State var system: SystemObject
    @State var scrollState = CGFloat.zero
    @State var containerState = CGFloat.zero
    @State var page = 0
    @State var innerScrolling = false
    @State var startLoc = CGPoint(x:0, y:0)
    
    @EnvironmentObject var firebaseSession : FirebaseSession
    var changePageDist = UIScreen.main.bounds.width/4
    var body: some View {
        
            ScrollView() {
                VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            if(system.name=="Cardiac") {
                                HStack {
                                    Text("*Must include IVC*")
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(nil)
                                        .font(.footnote).padding(.top, 5).fixedSize(horizontal: false, vertical: true).offset(y:15)
                                    Spacer()
                                }
                            }
                            HStack {
                                Text("QUESTIONS")
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                                Spacer()
                                Image(system.icon).resizable()
                                .scaledToFit().frame(width:50, height:50).offset(y:-35)
                            }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width*(7/8))
                            HStack {
                                Text(self.system.desc)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(nil)
                                    .font(.footnote).padding(.top, 5).fixedSize(horizontal: false, vertical: true)
                                Spacer()
                            }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width*(7/8)).padding(.top, -10).offset(y:-10)

                        }
                        Spacer()
                    }.padding(.leading, 20)
                    

                    
                    ExDivider().padding(.vertical, 0)
                }.background(Color.white).offset(y:-20)
                VStack() {
                    if(system.name=="Aorta") {
                        AortaView(system: system)
                    } else if (system.name=="Genitourinary"){
                        RenalView(system: system)
                    } else if (system.name=="Soft tissue/MSK"){
                        SoftMSKVue(system: system)
                    } else {
                        VStack() {
                            ForEach(system.views, id: \.self) { view in
                                VStack(){
                                    if (view.type=="System") {
                                        link(label: view.name, destination: SystemView(systemID:  self.findSystemID(systemName: view.system), system: self.findSystemByName(systemName: view.system)), first: false, view: view)
                                    } else {
                                        link(label: view.name, destination: ScanView(scan: view), first: false, view: view)
                                    }
                                }
                            }
                        }.padding(.vertical, 20).frame(minHeight: 0, maxHeight: .infinity)
                    }

                    Spacer()
                }.offset(y: system.name=="Aorta" ? -7: 0).offset(y: system.name=="Genitourinary" ? -7: 0).offset(y: system.name=="Soft tissue/MSK" ? -7: 0).offset(y:-15)
                    Spacer().frame(height:500)
                }.background(Color.gray.opacity(0.12))
                
            }.navigationBarTitle(Text(system.name)).onAppear(){
                Analytics.logEvent("Opened_application", parameters: ["application" : self.system.name])
                self.system = self.firebaseSession.institutionData.systemsData[self.systemID]
        }.onDisappear(){
                Analytics.logEvent("Closed_application", parameters: ["application" : self.system.name])
        }

            
        
    }
    
    func findSystemByName(systemName: String) -> SystemObject{
        for i in 0...firebaseSession.institutionData.systemsData.count{
            if (firebaseSession.institutionData.systemsData[i].name == systemName){
                print("Got the system: " , i)
                return firebaseSession.institutionData.systemsData[i]
            }
        }
        return firebaseSession.institutionData.systemsData[0]
    }
    
    func findSystemID(systemName: String) -> Int{
        for i in 0...firebaseSession.institutionData.systemsData.count{
            if (firebaseSession.institutionData.systemsData[i].name == systemName){
                print("Got the system: " , i)
                return i
            }
        }
        return 0
    }
}




func link<Destination: View>(label: String, destination: Destination, first: Bool, view: SystemViewObject) -> some View {

    return NavigationLink(destination: destination) {
        VStack() {
//            if(first) {
//                Divider()
//            }
            Spacer().frame(height:15)
            HStack(spacing: 15) {
                if(view.type=="Loop") {
                    Image(systemName: "video.fill").resizable()
                        .scaledToFit().foregroundColor(Color.black.opacity(0.8))
                        .frame(width: 20, height: 20)
                } else {
                    Image(systemName: "camera.fill").resizable()
                    .scaledToFit().foregroundColor(Color.black.opacity(0.8))
                    .frame(width: 20, height: 20)
                }
            Text(label).font(.headline).foregroundColor(Color.black).fontWeight(.regular)
                Spacer()
                Image(systemName: "chevron.right").resizable().scaledToFit().frame(height:12).padding(.trailing).foregroundColor(Color.gray)
            }
            Spacer().frame(height:15)
            if(!first) {
                Divider().frame(height:2)
            }
        }.padding(.horizontal).background(Color.white)
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

struct ExDivider: View {
    let color: Color = .gray
    let width: CGFloat = 2
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(color.opacity(0.3))
                .frame(height: 1)
                .edgesIgnoringSafeArea(.horizontal)
            Rectangle()
            .fill(color.opacity(0.1))
            .frame(height: 1)
            .edgesIgnoringSafeArea(.horizontal)
        }
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
