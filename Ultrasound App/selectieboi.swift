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
    
    @EnvironmentObject var firebaseSession : FirebaseSession
    
    @Binding var category: Int
    
    
    var body: some View {
        VStack() {
            HStack() {
                Text(firebaseSession.institutionData.name).font(.title)
                
            }.padding(.vertical)
//            if(firebaseSession.categories[category]=="Aventura Hospital") {
//                AventuraRequirements()
//            } else if(firebaseSession.categories[category]=="Mount Sinai Medical") {
//                SinaiRequirements()
//            } else if(firebaseSession.categories[category]=="Jackson Memorial") {
//                JacksonRequirements()
//            } else {
//                HStack() {
//                    Text("Number needed to graduate: 250 scans.")
//                    .font(.body)
//                    Spacer()
//                }
//            }
            
            VStack(){
                ForEach(firebaseSession.institutionData.requirements,id: \.self) { req in
                    HStack() {
                        Text(req)
                        .font(.body)
                        Spacer()
                    }
                }
            }.padding(.horizontal)

            HStack() {
                Text("Credentialing")
                   .font(.subheadline)
               .foregroundColor(Color.black.opacity(0.5))
                Spacer()
            }.padding()
//
            VStack(){
                ForEach(firebaseSession.institutionData.requirements,id: \.self) { req in
                    HStack() {
                        Text(req)
                        .font(.body)
                        Spacer()
                    }
                }
            }.padding(.horizontal)
            
            Spacer()
//            HStack() {
//               Text("Select your institution:")
//                Spacer()
//            }.padding()
            
            Picker(selection: $category, label: Text("")) {
                           ForEach(0 ..< firebaseSession.categories.count) {
                            Text(self.firebaseSession.categories[$0]).foregroundColor(Color.black).multilineTextAlignment(.leading)
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
