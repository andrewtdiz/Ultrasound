//
//  ContentView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let defaults = UserDefaults.standard
    @State private var selection = false
    var categories = ["📖   TanjieLad    ", "🎵   ShibeTown   "]
    @State var category = -1
    @State var categoryFirst = 0
    var body: some View {
        ZStack{
            SystemListed(data: $category, selection: $selection)
        }
        .onAppear(){
            self.category = self.defaults.object(forKey: "category") as? Int ?? -1
            if (self.category != -1){
                self.selection = true
            }
            print("category set to: " , self.defaults.object(forKey: "category") as? Int ?? -1)
        }
        .sheet(isPresented: $selection, content: {
            VStack{
                selectieboi(category: self.$categoryFirst)
                    .font(.title)
                    Button(action: {
                        if ((self.category != self.categoryFirst)){
                        self.category = self.categoryFirst
                        self.selection = false
                        self.defaults.set(self.category,forKey: "category")
                        }
                    }){
                        Text("Save changes")
                            .opacity((self.category != self.categoryFirst) ? 1 : 0.5 )
                    }
            }
        })
    }
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
