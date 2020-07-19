//
//  AventuraRequirements.swift
//  Ultrasound App
//
//  Created by DiZenzo on 7/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct AventuraRequirements: View {
    var body: some View {
        VStack() {
            HStack() {
                Text("Number needed to graduate: 250 scans.")
                .font(.body)
                Spacer()
            }
            HStack() {
                Text("Record examinations for review and comparison and review to stock “normal” images.")
                .font(.body)
                    Spacer()
            }
            
        }.padding(.horizontal).padding(.vertical,0)
    }
}

struct AventuraRequirements_Previews: PreviewProvider {
    static var previews: some View {
        AventuraRequirements()
    }
}
