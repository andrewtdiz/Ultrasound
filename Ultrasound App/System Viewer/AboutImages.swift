//
//  AboutImages.swift
//  Ultrasound App
//
//  Created by DiZenzo on 7/18/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct AboutImages: View {
    var body: some View {
        VStack() {
            HStack() {
                Spacer()
                VStack() {
                    Image("posaw").resizable().scaledToFit()
                    .frame(width: 100.0,height:100)
                    Text("Leila PoSaw, MD MPH")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text("EUS Director, JMH")
                        .font(.caption)
                }
                
                Spacer()
                VStack() {
                    Image("andrew").resizable().scaledToFit()
                    .frame(width: 100.0,height:100)
                    Text("Andrew DiZenzo, MS3")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text("Developer/Project Manager")
                        .font(.caption)
                }
                Spacer()
            }
            HStack() {
                Spacer()
                VStack() {
                    Image("nisha").resizable().scaledToFit()
                    .frame(width: 100.0,height:100)
                    Text("Nish Puri, MS4")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text("Project Manager")
                        .font(.caption)
                }
                Spacer()
                VStack() {
                    Image("kerry").resizable().scaledToFit()
                    .frame(width: 100.0,height:100)
                    Text("Kerry O'Sullivan, MS4")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text("Project Manager")
                        .font(.caption)
                }
                Spacer()
            }
        }
    }
}

struct AboutImages_Previews: PreviewProvider {
    static var previews: some View {
        AboutImages()
    }
}
