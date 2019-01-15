//
//  MainBase.swift
//  SaleManager
//
//  Created by Mac on 08.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import Firebase

struct Sales {
    
    let ref: DatabaseReference?
    let key: String
    let invoiceNumber: Int
    let name: String
    let surname: String
    let tel: String
    let city: String
    let post: String
    let count: Int
    let titel: String
    let isCompleted: Bool
    let inArchive: Bool
    
    init(invoiceNumber: Int, name: String, surname: String, tel: String, city: String, post: String, count: Int, titel: String, isCompleted: Bool, inArchive: Bool, key: String = "") {
        self.ref = nil
        self.key = key
        self.invoiceNumber = invoiceNumber
        self.name = name
        self.surname = surname
        self.tel = tel
        self.city = city
        self.post = post
        self.count = count
        self.titel = titel
        self.isCompleted = isCompleted
        self.inArchive = inArchive
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let invoiceNumber = value["invoiceNumber"] as? Int,
            let name = value["name"] as? String,
            let surname = value["surname"] as? String,
            let tel = value["tel"] as? String,
            let city = value["city"] as? String,
            let post = value["post"] as? String,
            let count = value["count"] as? Int,
            let titel = value["titel"] as? String,
            let isCompleted = value["isCompleted"] as? Bool,
            let inArchive = value["inArchive"] as? Bool
            else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.invoiceNumber = invoiceNumber
        self.name = name
        self.surname = surname
        self.tel = tel
        self.city = city
        self.post = post
        self.count = count
        self.titel = titel
        self.isCompleted = isCompleted
        self.inArchive = inArchive

    }
    
    func toAnyObject() -> Any {
        return [
            
            "invoiceNumber": invoiceNumber,
            "name": name,
            "surname": surname,
            "tel": tel,
            "city": city,
            "post": post,
            "count": count,
            "titel": titel,
            "isCompleted": isCompleted,
            "inArchive": inArchive,
        ]
    }
}
