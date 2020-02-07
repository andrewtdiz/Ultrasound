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
    @State var viewState = CGSize.zero
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    
                    HStack(spacing: CGFloat(self.offst)) {
                        if(images.count==1) {
                            Text("Clip").font(.footnote)
                            .foregroundColor(Color.black).frame(width: CGFloat(self.tabWidth)).padding(.bottom, 5)
                        } else {
                        ForEach(0..<images.count, id: \.self) { i in
                            Button(action: {
                                self.page = i
                            }) {
                                Text(self.labels[i]).font(.footnote)
                                    .foregroundColor(self.page==i ? Color.black : Color.gray).frame(width: CGFloat(self.tabWidth)).padding(.bottom, 5)
                            }.frame(width: 100)
                        }
                        }
                    }
                
//                    VStack() {
//                        Spacer()
//                        HStack {
//                            RoundedRectangle(cornerRadius:CGFloat(2)).fill(Color.blue).frame(width: self.tabWidth, height: CGFloat(2)).offset(x:tabOffset(page:self.page, pages: self.images.count, tabWidth: Int(self.tabWidth), offst: Int(self.offst))).animation(.spring())
//                        }
//                    }
                    
                }.padding(.leading).frame(maxHeight: 35)
                Spacer()
            }
            // Text(viewState.width.description)
            HStack() {
                
                if(images[0].type=="Frame") {
                HStack(spacing:0) {
                    
                        ForEach(0..<images.count, id: \.self) { i in
                            VStack() {
                                    if (i<2) {
                                        Image(self.images[i].image).resizable().scaledToFit().frame(width: UIScreen.main.bounds.width)
                                    } else {
                                        GIFView(gifName: self.images[i].image)
                                    }
                            
                                
                            }.frame(width: UIScreen.main.bounds.width).frame(maxHeight: 300).offset(x: UIScreen.main.bounds.width/2)
                                .animation(.spring())
                        }
                    
                    
                    
                    }.frame(width: UIScreen.main.bounds.width).clipped()
                    } else {
                        VStack() {
                            GIFView(gifName: self.images[0].image).frame(height: 300).frame(width: UIScreen.main.bounds.width)
                        }.frame(width: UIScreen.main.bounds.width).clipped()
                    }
            }
            // .offset(x: viewState.width).offset(x: calcOffset(page:self.page, pages:images.count)).animation(.spring()).gesture(DragGesture()
               //     .onChanged { value in
                 //       self.viewState = value.translation
                //}
                  //  .onEnded { value in
                    //    if(self.page==0 && self.viewState.width < -50) {
                      //      self.page = self.page + 1
                      //  } else if (self.page==1 && self.viewState.width < -50 && self.images.count>2) {
                       //     self.page = self.page + 1
                        // }
                        // self.viewState = .zero
                    // })
        }
    }
}


struct ScanImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        ScanImageViewer(images: systemsData[0].views[5].images)
    }
}
