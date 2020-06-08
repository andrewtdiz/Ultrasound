//
//  ScanView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/27/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct ScanView: View {
    var scan: SystemViewObject
    
    var body: some View {
        ScrollView {
            if(!scan.images.isEmpty) {
                ScanImageViewer(images: scan.images)
            }
            VStack {
                if(scan.dostring != " ") {
                    HStack {
                        Text("DO")
                        .font(.footnote)
                        .foregroundColor(Color.black.opacity(0.6))
                        Spacer()
                    }.padding(.horizontal).padding(.top, 30).padding(.bottom, 10)
                    HStack {
                        Text(scan.dostring).font(.body).padding(.horizontal).padding(.vertical)
                        Spacer()
                    }
                }
                if(scan.optimize != " ") {
                    HStack {
                        Text("OPTIMIZE")
                        .font(.footnote)
                        .foregroundColor(Color.black.opacity(0.6))
                        Spacer()
                    }
                    .padding(.horizontal).padding(.top, 30).padding(.bottom, 10)
                    HStack {
                        Text(scan.optimize).font(.body).padding(.horizontal).padding(.vertical)
                        Spacer()
                    }
                }
                if(scan.measure != " ") {
                    HStack {
                        Text("MEASURE")
                        .font(.footnote)
                        .foregroundColor(Color.black.opacity(0.6))
                        Spacer()
                    }.padding(.horizontal).padding(.top, 30).padding(.bottom, 10)
                    HStack {
                        Text(scan.measure).font(.body).padding(.horizontal).padding(.vertical)
                        Spacer()
                    }
                    
//                }
            }
            
        }
        .offset(y:-2)
        .navigationBarTitle(Text(scan.name))
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(scan: systemsData[1].views[0])
    }
}
}
