//
//  ScanImageViewer.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/21/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct ScanImageViewer: View {
    @State var page = 0
    var offst = UIScreen.main.bounds.width/16
    var tabWidth = CGFloat(75)
    var images: [SystemImage]
    var labels = ["Unlabeled", "Labeled", "Clip"]
    @State var isLabeled:Bool = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        
        VStack{
            ZStack{
                if (images[0].type == "Frame"){
                    Image(self.images[0].image).resizable().scaledToFit().frame(height: 300).frame(width: UIScreen.main.bounds.width)
                    .opacity((self.isLabeled) ? 0:1)
                    Image(self.images[1].image).resizable().scaledToFit().frame(height: 300).frame(width: UIScreen.main.bounds.width)
                    .opacity((self.isLabeled) ? 1:0)
                }else{
                    GIFView(gifName: self.images[0].image).frame(height: 300).frame(width: UIScreen.main.bounds.width)
                    .opacity((self.isLabeled) ? 0:1)
                    Image(self.images[1].image).resizable().scaledToFit().frame(height: 300).frame(width: UIScreen.main.bounds.width)
                    .opacity((self.isLabeled) ? 1:0)
                }
            }
            HStack() {
                Spacer()
                Toggle(isOn: self.$isLabeled){
                    Text("Show Labeling").font(.body)
                }
            }
            
            .padding(5)
            
        }
        
        
        
        
//        VStack {
//            HStack {
//                ZStack {
//
//                    HStack(spacing: CGFloat(self.offst)) {
//                        if(images.count==1) {
//                            Text("Clip").font(.footnote)
//                            .foregroundColor(Color.black).frame(width: CGFloat(self.tabWidth)).padding(.bottom, 5)
//                        } else {
//                            Toggle(isOn: self.$isLabeled){
//                                Text("Labeled").font(.title)
//                            }
//                            .padding(.bottom, 5)
//                        }
//                    }
//
//                }.padding(.leading).frame(maxHeight: 35)
//                Spacer()
//            }
//            // Text(viewState.width.description)
//            HStack() {
//
//                if(images[0].type=="Frame") {
//                HStack(spacing:0) {
//
//                        ForEach(0..<images.count, id: \.self) { i in
//                            ZStack() {
//                                    if (i<2) {
//                                        Image(self.images[i].image).resizable().scaledToFit().frame(width: UIScreen.main.bounds.width)
//                                    } else {
//                                        GIFView(gifName: self.images[i].image)
//                                    }
//
//
//                            }.frame(width: UIScreen.main.bounds.width).frame(maxHeight: 300).offset(x: UIScreen.main.bounds.width/2)
//                                .animation(.spring())
//                        }
//
//
//
//                    }.frame(width: UIScreen.main.bounds.width).clipped()
//                    } else {
//                        VStack() {
//                            GIFView(gifName: self.images[0].image).frame(height: 300).frame(width: UIScreen.main.bounds.width)
//                        }.frame(width: UIScreen.main.bounds.width).clipped()
//                    }
//            }
//        }
        
        
        
    }
}


struct ScanImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        ScanImageViewer(images: systemsData[8].views[2].images)
    }
}
