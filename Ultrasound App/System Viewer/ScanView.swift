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
            VStack() {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("LAST UPDATED ONE WEEK AGO")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                            Spacer()
                            
                        }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width*(7/8))
                        HStack {
                            Text(self.scan.desc)
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                                .font(.footnote).padding(.top, 5).fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width*(7/8)).padding(.top, 7)

                    }
                    Spacer()
                }.padding(.leading, 20)
                

                
                Divider().padding(.vertical, 0)
            }
            if(!scan.images.isEmpty) {
                ScanImageViewer(images: scan.images).padding(.top)
            }
            HStack() {
                Text(scan.desc).font(.body).padding(.horizontal)
                Spacer()
            }
            
        }.offset(y:-2).navigationBarTitle(Text(scan.name))
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(scan: systemsData[0].views[0])
    }
}
