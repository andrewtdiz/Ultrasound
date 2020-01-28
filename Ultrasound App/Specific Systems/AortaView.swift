//
//  AortaView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/27/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct AortaView: View {
    var system: SystemObject
    var body: some View {
            VStack(spacing:10) {
                HStack {
                    Text("TRANSVERSE")
                    .font(.footnote)
                        .foregroundColor(Color.black.opacity(0.6))
                    Spacer()
                }.padding(.horizontal)
                VStack() {
                    link(label: system.views[0].name, destination: ScanView(scan: system.views[0]), first: true, view: system.views[0])
                    HStack() {
                        Spacer()
                        Text("OR THE FOLLOWING 4 CLIPS:")
                        .font(.footnote)
                            .foregroundColor(Color.black.opacity(0.5)).frame(height:40)
                        Spacer()
                    }
                    link(label: system.views[1].name, destination: ScanView(scan: system.views[1]), first: false, view: system.views[1])
                    link(label: system.views[2].name, destination: ScanView(scan: system.views[2]), first: false, view: system.views[2])
                    link(label: system.views[3].name, destination: ScanView(scan: system.views[3]), first: false,view: system.views[3])
                    link(label: system.views[4].name, destination: ScanView(scan: system.views[4]), first: true, view: system.views[4])
                    HStack {
                        Text("SAGITTAL")
                        .font(.footnote)
                        .foregroundColor(Color.black.opacity(0.6))
                        Spacer()
                    }.padding(.horizontal).padding(.top, 30).padding(.bottom, 10)
                    link(label: system.views[5].name, destination: ScanView(scan: system.views[5]), first: false, view:  system.views[5])
                    link(label: system.views[6].name, destination: ScanView(scan: system.views[6]), first: true, view: system.views[6])
                }.listStyle(GroupedListStyle()).padding(0)

            Spacer()
            }.padding(.vertical, 20)
    }
}


struct ListHeader: View {
    var body: some View {
        HStack {
            Text("TRANSVERSE")
        }
    }
}
struct ListHeader2: View {
    var body: some View {
        HStack {
            Text("SAGITTAL")
        }
    }
}

struct ListFooter: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Or the following four frames")
            Spacer()
        }
    }
}

struct AortaView_Previews: PreviewProvider {
    static var previews: some View {
        AortaView(system: systemsData[0])
    }
}


