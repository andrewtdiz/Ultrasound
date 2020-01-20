//
//  ContentView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            SystemList()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                    }
                }
                .tag(0)
            SystemListed()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                    }
                }
                .tag(1)
            InfoScreen()
            .font(.title)
            .tabItem {
                VStack {
                    Image(systemName: "questionmark.circle.fill")
                }
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
