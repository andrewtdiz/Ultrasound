//
//  TestView.swift
//  Ultrasound App
//
//  Created by Andrew DiZenzo on 1/19/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI

struct TestView: View {
    var passed : String
    var body: some View {
        Text(passed)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(passed: "Test")
    }
}
