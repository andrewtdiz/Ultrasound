//
//  SoftMSKVue.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/28/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct SoftMSKVue: View {
    var system: SystemObject
    var body: some View {
        VStack(spacing:10) {
            HStack {
                Text("NORMAL VIEWS")
                .font(.footnote)
                    .foregroundColor(Color.black.opacity(0.6))
                Spacer()
            }.padding(.horizontal)
            VStack() {
                link(label: system.views[0].name, destination: ScanView(scan: system.views[0]), first: false, view: system.views[0])
                link(label: system.views[1].name, destination: ScanView(scan: system.views[1]), first: true, view: system.views[1])
                HStack {
                    Text("ABNORMAL VIEWS")
                    .font(.footnote)
                    .foregroundColor(Color.black.opacity(0.6))
                    Spacer()
                }.padding(.horizontal).padding(.top, 30).padding(.bottom, 10)
                link(label: system.views[2].name, destination: ScanView(scan: system.views[2]), first: false, view:  system.views[2])
                link(label: system.views[3].name, destination: ScanView(scan: system.views[3]), first: true, view: system.views[3])
                Spacer().frame(height:30)
                link(label: system.views[4].name, destination: ScanView(scan: system.views[4]), first: true, view: system.views[4])
                
                
            }.listStyle(GroupedListStyle()).padding(0)

        Spacer()
        }.padding(.vertical, 20)
    }
}

struct SoftMSKVue_Previews: PreviewProvider {
    static var previews: some View {
        SoftMSKVue(system: systemsData[11])
    }
}
