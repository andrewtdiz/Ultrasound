//
//  JacksonRequirements.swift
//  Ultrasound App
//
//  Created by DiZenzo on 7/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct JacksonRequirements: View {
    var body: some View {
        VStack() {
            HStack() {
                Text("Number needed to graduate: 250 scans.")
                .font(.body)
                Spacer()
            }
            HStack() {
                Text("Numbers per JMH adult/pediatric ED rotation: 10.")
                .font(.body)
                    Spacer()
            }
            HStack() {
                Text("Educational scans: Upload to Q-path.")
                    .font(.body)
                Spacer()
            }
            HStack() {
                Text("Direct patient care scans: Upload to PACS and Q-path.")
                    .font(.body)
                Spacer()
            }
            
            HStack() {
            Text("US machines capable of PACS/Q-path upload:")
                .font(.body)
                Spacer()
            }
            HStack() {
            Text("JMH Adult ED, JMH Pediatric ED, Ryder Trauma Center.")
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
                Text("Number per US application: 25 scans.")
                    .font(.body)
                Spacer()
            }
            HStack(){
                Text("Number of HIMAP/RUSH and Triple Scan: 10 scans each.")
                .font(.body)
                    Spacer()
            }
            HStack() {
                Text("Total procedural scans: 5. ")
                .font(.body).padding(.bottom).padding(.horizontal,0)
                Spacer()
            }
            
        }.padding(.horizontal).padding(.vertical,0)
    }
}

struct JacksonRequirements_Previews: PreviewProvider {
    static var previews: some View {
        JacksonRequirements()
    }
}
