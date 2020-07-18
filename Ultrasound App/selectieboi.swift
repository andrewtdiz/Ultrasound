//
//  selectieboi.swift
//  Ultrasound App
//
//  Created by Christopher Dizenzo on 5/14/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI
import Firebase

struct selectieboi: View {
    
    var categories = ["Jackson Memorial", "Mount Sinai Medical", "Aventura Hospital", "Saint Lucie Medical"]
    @Binding var category: Int
    
    var body: some View {
        VStack() {
            HStack() {
                Text("Jackson Memorial Hospital").font(.title)
                
            }.padding(.vertical)
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
            Spacer()
//            HStack() {
//               Text("Select your institution:")
//                Spacer()
//            }.padding()
            
            Picker(selection: $category, label: Text("")) {
                           ForEach(0 ..< categories.count) {
                            Text(self.categories[$0]).foregroundColor(Color.black).multilineTextAlignment(.leading)
                           }
            }
        }.onAppear(){
            Analytics.logEvent("Open_modal", parameters: nil)
        }.onDisappear(){
            Analytics.logEvent("Closed_modal", parameters: nil)
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
