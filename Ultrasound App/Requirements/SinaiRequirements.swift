//
//  SinaiRequirements.swift
//  Ultrasound App
//
//  Created by DiZenzo on 7/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct SinaiRequirements: View {
    var body: some View {
        VStack() {
            HStack() {
                Text("Number needed to graduate: 250 scans.")
                .font(.body)
                Spacer()
            }
            
        }.padding(.horizontal).padding(.vertical,0)
    }
}

struct SinaiRequirements_Previews: PreviewProvider {
    static var previews: some View {
        SinaiRequirements()
    }
}
