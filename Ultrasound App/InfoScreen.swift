//
//  InfoScreen.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct InfoScreen: View {
    var body: some View {
        VStack() {
            Text("Welcome to Andrew's Ultrasound app")
            Spacer()
        }.onAppear {
            print(systemsData)
        }
    }
}

struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        InfoScreen()
    }
}
