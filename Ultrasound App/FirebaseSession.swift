//
//  FirebaseSession.swift
//  Ultrasound App
//
//  Created by DiZenzo on 7/12/20.
//  Copyright © 2020 Andrew DiZenzo. All rights reserved.
//

import SwiftUI
import Firebase
import CodableFirebase


class FirebaseSession : ObservableObject{
    
    
    let db = Firestore.firestore()
    let defaults = UserDefaults.standard
    @Published var categories : [String] = []
    
    @Published var institutionData : Institution
    
    
    init() {
        let systemsData = combineSysAndViews(viewsData: load("SystemViews.JSON"), systemsData:load("SystemObjects.JSON"), systemsImages:load("SystemImages.JSON"))
        institutionData = Institution(id: 0, name: "Jackson Memorial", requirements: ["Number needed to graduate: 250 scans.", "Numbers per JMH adult/pediatric ED rotation: 10.", "Educational scans: Upload to Q-path.", "Direct patient care scans: Upload to PACS and Q-path.", "US machines capable of PACS/Q-path upload:", "JMH Adult ED, JMH Pediatric ED, Ryder Trauma Center."], credentialing: ["Number per US application: 25 scans.", "Number of HIMAP/RUSH and Triple Scan: 10 scans each.", "Total procedural scans: 5. "], systemsData: systemsData)
        getCategories()
        
    }
    func getCategories(){
        db.collection("Institutions").document("InstitutionData").getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()!["Categories"]
                print("Document data: \(dataDescription)")
                self.categories = dataDescription as! [String]
            } else {
                print("Document does not exist")
            }
        }

    }
    
    
    func getInstitutionData(category: Int){
        db.collection("Institutions").whereField("id", isEqualTo: category)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    do {
                        self.institutionData = try FirebaseDecoder().decode(Institution.self, from: (self.defaults.object(forKey: self.categories[category]) as? Institution)!)
                        print("Successfull pull from local data!")
                    } catch let error {
                        print(error)
                    }
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID)")
                        let dataDescription = document.data()
                        do {
                            self.institutionData = try FirebaseDecoder().decode(Institution.self, from: dataDescription)
                            self.defaults.set(dataDescription,forKey: self.institutionData.name)
                            print("Successfull pull and save!")
//                            print(dataDescription)
                            self.db.collection("Institutions").document(document.documentID).addSnapshotListener { docSnap, error in
                                guard let document = docSnap else {
                                    print("Error fetiching document")
                                    return
                                }
                                guard let data = document.data() else {
                                    print("document data empty")
                                    return
                                }
                                do {
                                    self.institutionData = try FirebaseDecoder().decode(Institution.self, from: data)
                                    self.defaults.set(data,forKey: self.institutionData.name)
                                    print("On change successfull pull and save!")
                                } catch {
                                    print("Error decoding")
                                }
                            }
                        } catch let error {
                            print(error)
                        }
                    }
                }
        }
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


        
    //    func setCategories(cats: [String]){
    //        db.collection("Institutions").document("InstitutionData").setData(["Categories" : cats])
    //    }
        
    //    func setFirebaseData(category: Int){
    //
    //        let categories = ["Jackson Memorial", "Mount Sinai Medical", "Aventura Hospital", "Saint Lucie Medical", "UCF Oceola", "UF Jacksonville"]
    //
    //        var reqs = [String : [String]]()
    //
    //        reqs["Jackson Memorial"] = ["Number needed to graduate: 250 scans.", "Numbers per JMH adult/pediatric ED rotation: 10.", "Educational scans: Upload to Q-path.", "Direct patient care scans: Upload to PACS and Q-path.", "US machines capable of PACS/Q-path upload:", "JMH Adult ED, JMH Pediatric ED, Ryder Trauma Center."]
    //        reqs["Mount Sinai Medical"] = ["Number needed to graduate: 250 scans."]
    //        reqs["Aventura Hospital"] = ["Number needed to graduate: 250 scans."]
    //        reqs["Saint Lucie Medical"] = ["Number needed to graduate: 250 scans."]
    //        reqs["UCF Oceola"] = ["Number needed to graduate: 250 scans."]
    //        reqs["UF Jacksonville"] = ["Number needed to graduate: 250 scans."]
    //
    //
    //        var creds = [String : [String]]()
    //
    //        creds["Jackson Memorial"] = ["Number per US application: 25 scans.", "Number of HIMAP/RUSH and Triple Scan: 10 scans each.", "Total procedural scans: 5. "]
    //        creds["Mount Sinai Medical"] = ["Number per US application: 25 scans."]
    //        creds["Aventura Hospital"] = ["Number per US application: 25 scans."]
    //        creds["Saint Lucie Medical"] = ["Number per US application: 25 scans."]
    //        creds["UCF Oceola"] = ["Number per US application: 25 scans."]
    //        creds["UF Jacksonville"] = ["Number per US application: 25 scans."]
    //
    //        if (category >= 0){
    //            let temp = Institution(id: category, name: categories[category], requirements: reqs[categories[category]]!, credentialing: creds[categories[category]]!, systemsData: systemsData)
    //            let jsonData = try! FirestoreEncoder().encode(temp)
    //            db.collection("Institutions").document(categories[category]).setData(jsonData)
    //                print(jsonData)
    //        }
    //    }
}
