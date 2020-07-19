//
//  ScanView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/27/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI
import Firebase

struct ScanView: View {
    var scan: SystemViewObject
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        ScrollView {
            if(!scan.images.isEmpty) {
                ScanImageViewer(images: scan.images)
            }
            VStack {
                if(scan.dostring != " ") {
                    HStack {
                        Text("DO")
                            .font(.subheadline)
                        .foregroundColor(Color.black.opacity(0.5))
                        Spacer()
                    }.padding(.horizontal).padding(.top, 30)
                    HStack {
                        Text(scan.dostring).font(.body).padding(.horizontal).padding(.vertical, 8)
                        Spacer()
                    }
                }
                if(scan.optimize != " ") {
                    HStack {
                        Text("OPTIMIZE")
                            .font(.subheadline)
                        .foregroundColor(Color.black.opacity(0.5))
                        Spacer()
                    }
                    .padding(.horizontal).padding(.top, 30)
                    HStack {
                        Text(scan.optimize).font(.body).padding(.horizontal).padding(.vertical, 8)
                        Spacer()
                    }
                }
                if(scan.measure != " ") {
                    HStack {
                        Text("MEASURE")
                            .font(.subheadline)
                        .foregroundColor(Color.black.opacity(0.5))
                        Spacer()
                    }.padding(.horizontal).padding(.top, 30)
                    HStack {
                        Text(scan.measure).font(.body).padding(.horizontal).padding(.vertical, 8)
                        Spacer()
                    }
                    
//                }
            }
                Text("Note: The reference(s) for any and all medical information on this page can be accessed in the About tab of the home page.")
                    .font(.caption).padding(.top)
            
        }
        .offset(y:-2)
        .navigationBarTitle(Text(scan.name)).onAppear(){
                Analytics.logEvent("Opened_view", parameters: ["application" : self.scan.name])
            Analytics.setUserID(self.defaults.object(forKey: "userID") as? String ?? "")
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(scan: systemsData[1].views[0])
    }
}
}
