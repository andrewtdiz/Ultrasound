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
                Text("Educational Scans: Upload to Q-path with report and documentation in medical record. ")
                .font(.body)
                    Spacer()
            }
            HStack() {
                Text("Credentialing")
                   .font(.subheadline)
               .foregroundColor(Color.black.opacity(0.5))
                Spacer()
            }.padding(.vertical)
           
            HStack(){
                Text("Number per US application: 25.")
                    .font(.body)
                Spacer()
            }
            HStack() {
                Text("Total procedural scans: 10. ")
                .font(.body).padding(.bottom).padding(.horizontal,0)
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
