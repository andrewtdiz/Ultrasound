//
//  About.swift
//  Ultrasound App
//
//  Created by DiZenzo on 7/18/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI
import Firebase

struct About: View {
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack(spacing: 0){
            HStack() {
                Text("About").font(.largeTitle).fontWeight(.bold)
                Spacer()
            }
            HStack() {
                Text("This app was produced by:")
                    .font(.footnote)
                Spacer()
            }
            
            
            AboutImages().padding(.bottom)
            
            Spacer()
            HStack() {
                Text("Non-medical personel should consult with a doctor before making medical decisions.").font(.footnote).padding(.all,0)
                Spacer()
            }.padding(.all,0)
            
            
            HStack() {
                Text("Information in this app was developed by physicians from across the country in addition to the ACEP Compendium.").font(.footnote).padding(.vertical)
                Spacer()
            }
            
            
            HStack() {
                Text("References:").font(.footnote)
                Spacer()
            }
            
            
            VStack() {
                Text("Dr. Leila PoSaw MD, Dr. David Kinas DO, Dr. Huy Tran MD, Dr. David Hotwagner DO, Dr. Javier Rosario MD, Dr. Andrew Shannon MD MPH ").font(.footnote).padding(.vertical)
            }
            
            
            Button("ACEP Compendium") {UIApplication.shared.open(URL(string: "https://pubmed.ncbi.nlm.nih.gov/27343675/")!)}
            
            
        }.padding().onAppear(){
                Analytics.logEvent("About_opened", parameters: nil)
            Analytics.setUserID(self.defaults.object(forKey: "userID") as? String ?? "")
        }.onDisappear(){
                Analytics.logEvent("About_closed", parameters: nil)
            Analytics.setUserID(self.defaults.object(forKey: "userID") as? String ?? "")
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
