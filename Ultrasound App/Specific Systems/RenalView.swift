//
//  RenalView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/28/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct RenalView: View {
    var system: SystemObject
    var body: some View {
        VStack(spacing:10) {
            HStack {
                Text("LEFT")
                .font(.footnote)
                    .foregroundColor(Color.black.opacity(0.6))
                Spacer()
            }.padding(.horizontal)
            VStack() {
                link(label: system.views[5].name, destination: ScanView(scan: system.views[5]), first: false, view: system.views[5])
                link(label: system.views[3].name, destination: ScanView(scan: system.views[3]), first: false, view: system.views[3])
                link(label: system.views[4].name, destination: ScanView(scan: system.views[4]), first: true, view: system.views[4])
                HStack {
                    Text("RIGHT")
                    .font(.footnote)
                    .foregroundColor(Color.black.opacity(0.6))
                    Spacer()
                }.padding(.horizontal).padding(.top, 30).padding(.bottom, 10)
                link(label: system.views[2].name, destination: ScanView(scan: system.views[2]), first: false, view:  system.views[2])
                link(label: system.views[0].name, destination: ScanView(scan: system.views[0]), first: false, view: system.views[0])
                link(label: system.views[1].name, destination: ScanView(scan: system.views[1]), first: true, view: system.views[1])
                HStack {
                    Text("BLADDER VOLUME")
                    .font(.footnote)
                    .foregroundColor(Color.black.opacity(0.6))
                    Spacer()
                }.padding(.horizontal).padding(.top, 30).padding(.bottom, 10)
                link(label: system.views[6].name, destination: ScanView(scan: system.views[6]), first: false,view: system.views[6])
                link(label: system.views[7].name, destination: ScanView(scan: system.views[7]), first: true, view: system.views[7])
                
                
            }.listStyle(GroupedListStyle()).padding(0)

        Spacer()
        }.padding(.vertical, 20)
    }
}

struct RenalView_Previews: PreviewProvider {
    static var previews: some View {
        RenalView(system: systemsData[10])
    }
}
