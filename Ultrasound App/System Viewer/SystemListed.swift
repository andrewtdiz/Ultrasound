//
//  SystemListed.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI
import Firebase

struct SystemListed: View {
    
    let defaults = UserDefaults.standard
    
    @Binding var data: Int
    
    @Binding var selection: Bool
    
    @Binding var activeSheet: ActiveSheet
    
    @EnvironmentObject var firebaseSession : FirebaseSession
    
    
    var body: some View {
        NavigationView {
            List(firebaseSession.institutionData.systemsData) { system in
                NavigationLink(destination: SystemView(systemID: self.findSystemID(systemName: system.name),system: system).environmentObject(self.firebaseSession)) {
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
            }.navigationBarTitle(Text("Applications")).onAppear(){
                    Analytics.logEvent("Opened_list", parameters: nil)
                Analytics.setUserID(self.defaults.object(forKey: "userID") as? String ?? "")
            }
        .navigationBarItems(leading:
                Button(action: {self.selection = true
                    self.activeSheet = .second
                    
                }){
                    Text("About")
                }, trailing:
                Button(action: {self.selection = true
                    self.activeSheet = .first
                    
                }){
                    Image(systemName: "gear")
                        .scaleEffect(3/2)
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.gray)
                }
            
            
        )
            
            }.navigationViewStyle(StackNavigationViewStyle())
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


struct SystemListed_Previews: PreviewProvider {
    @State static var data1 = 0
    @State static var data2 = false
    @State static var data3: ActiveSheet = .first
    static var previews: some View {
        SystemListed(data: $data1, selection: $data2, activeSheet: $data3)
    }
}
