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
    
    var categories = ["Jackson Memorial", "Mount Sinai Medical", "Aventura Hospital", "Saint Lucie Medical", "UCF Oceola", "UF Jacksonville"]
    @Binding var category: Int
    
    
    var body: some View {
        VStack() {
            HStack() {
                Text(categories[category]).font(.title)
                
            }.padding(.vertical)
            if(categories[category]=="Aventura Hospital") {
                AventuraRequirements()
            } else if(categories[category]=="Mount Sinai Medical") {
                SinaiRequirements()
            } else if(categories[category]=="Jackson Memorial") {
                JacksonRequirements()
            } else {
                HStack() {
                    Text("Number needed to graduate: 250 scans.")
                    .font(.body)
                    Spacer()
                }
            }
            
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
