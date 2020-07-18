//
//  FirebaseSession.swift
//  Ultrasound App
//
//  Created by DiZenzo on 7/12/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI
import Firebase


class FirebaseSession : ObservableObject{
    
    
    let db = Firestore.firestore()
    init() {
        db.collection("users").addDocument(data: [
            "user_data" : self.getTodayString(),
        ])
    }
    
    
    
    func getTodayString() -> String{

       let date = Date()
       let calender = Calendar.current
       let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)

       let year = components.year
       let month = components.month
       let day = components.day
       let hour = components.hour
       let minute = components.minute
       let second = components.second

       let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)

       return today_string

   }

    
}
