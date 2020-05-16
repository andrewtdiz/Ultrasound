//
//  selectieboi.swift
//  Ultrasound App
//
//  Created by Christopher Dizenzo on 5/14/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct selectieboi: View {
    
    var categories = ["📖   TanjieLad    ", "🎵   ShibeTown   "]
    @Binding var category: Int
    
    var body: some View {
        Picker(selection: $category, label: Text("")) {
                       ForEach(0 ..< categories.count) {
                        Text(self.categories[$0]).foregroundColor(Color.black).multilineTextAlignment(.leading)
                       }
        }
    }
}

struct selectieboi_Previews: PreviewProvider {
    @State static var category = 0
    static var previews: some View {
        HStack{
            selectieboi(category: $category)
            Spacer()
        }
    }
}
