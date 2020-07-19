//
//  ContentView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    let defaults = UserDefaults.standard
    @State private var selection = false
    @State private var aboutSection = false
    @State var category = -1 {
        didSet {
            print("DidSet: " , category)
            switch category {
            case 0:
                systemsData = combineSysAndViews(viewsData: load("SystemViews.JSON"), systemsData:load("SystemObjects.JSON"), systemsImages:load("SystemImages.JSON"))
                break;
            case 1:
                systemsData = combineSysAndViews(viewsData: load("SystemViewsMSMC.JSON"), systemsData:load("SystemObjectsMSMC.JSON"), systemsImages:load("SystemImagesMSMC.JSON"))
                break;
            default:
                systemsData = combineSysAndViews(viewsData: load("SystemViews.JSON"), systemsData:load("SystemObjects.JSON"), systemsImages:load("SystemImages.JSON"))
                break;
            }
        }
    }
    @State var categoryFirst = 0
    @State var userID = ""
    @State var tempUserID = ""
    @State var alert = false
    
    @State private var activeSheet: ActiveSheet = .first
    
    var body: some View {
        ZStack{
            SystemListed(data: $category, selection: $selection, activeSheet: $activeSheet)
        }
        .onAppear(){
            self.userID = self.defaults.object(forKey: "userID") as? String ?? ""
            self.tempUserID = self.userID
            print("Creebo-->" , self.userID,"<---")
            self.category = self.defaults.object(forKey: "category") as? Int ?? -1
            if (self.category == -1){
                self.selection = true
            }
            if (self.userID == "") {
                self.selection = true
            }
            print("category set to: " , self.defaults.object(forKey: "category") as? Int ?? -1)
        }
        .sheet(isPresented: $selection, onDismiss: {
            self.userID = self.tempUserID
            if(self.userID == "") {
                self.selection = true
            } else {
                Analytics.setUserID(self.userID)
                self.defaults.set(self.userID, forKey: "userID")
            }
        }, content: {
            if self.activeSheet == .second {
                About()
            } else {
            VStack{
                if(self.userID == "" && self.selection) {
                    VStack(spacing: 0) {
                        Spacer()
                        
                        Text("Your One-Time ID").font(.title)
                        Text("First initial + last initial + last 4 of your phone number")
                            .multilineTextAlignment(.center)
                        Text("(Example: AD0305)")
                        HStack() {
                            Spacer()
                            TextField("Enter your ID", text: self.$tempUserID).textFieldStyle(RoundedBorderTextFieldStyle())
                            Spacer()
                        }.padding()
                        
                       
                        Text("This educational application collects utilization data, which will be used for quality improvement purposes. All reported data will be anonymous. Use of this application implies consent.").font(.footnote).foregroundColor(.gray).padding()
                        Spacer()
                    }
                }
                if(!(self.userID == "" && self.selection)) {
                    selectieboi(category: self.$categoryFirst)
                    .font(.title)
                }
                if(!(self.userID == "" && self.selection)) {
                    Button(action: {
                        if ((self.category != self.categoryFirst)){
                        self.category = self.categoryFirst
                        self.selection = false
                        self.defaults.set(self.category,forKey: "category")
                        
                        Analytics.logEvent("Changed_institution", parameters: ["Institution" : self.category])
                        
                        }
                    }){
                        Text("Save changes")
                            .opacity((self.category != self.categoryFirst) ? 1 : 0.5 )
                    }
                }
                Spacer()
            }
            }
            })
    }
}


enum ActiveSheet {
   case first, second
}


//struct selectionView: View {
//    @Binding var category :Int
//    @Binding var categoryFirst:Int
//    let defaults = UserDefaults.standard
//    var body: some View{
//        VStack{
//            Spacer()
//            Text("I'm creebo!")
//            selectieboi(category: $categoryFirst)
//            Button(action: {
//                        self.category = self.categoryFirst
//                        self.defaults.set(self.category,forKey: "category")
//                    }){
//                        Text("Yea I want thaat!")
//                    }
//            Spacer()
//        }
//        .background(Color.purple)
//        .edgesIgnoringSafeArea(.all).transition(.slide)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
