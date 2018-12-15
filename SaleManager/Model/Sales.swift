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
   // let id: Int
    let surname: String
    let name: String
    let tel: String
    let post: String
    //let titel: String
   // let quantity: Int
    //let price: Int
    //let profit: Int
    //let image: String
    //var isTrue: Bool
    
    init(surname: String, name: String, tel: String, post: String, key: String = "") {
        self.ref = nil
        self.key = key
        //self.id = id
        self.surname = surname
        self.name = name
        self.tel = tel
        self.post = post
//        self.titel = titel
//        self.quantity = quantity
//        self.price = price
//        self.profit = profit
        //self.isTrue = isTrue
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            //let id = value["id"] as? Int,
            let surname = value["surname"] as? String,
            let name = value["name"] as? String,
            let tel = value["tel"] as? String,
            let post = value["post"] as? String
//            let titel = value["titel"] as? String,
//            let quantity = value["quantity"] as? Int,
//            let price = value["price"] as? Int,
//            let profit = value["profit"] as? Int
        
        //let isTrue = value["isTrue"] as? Bool
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        //self.id = id
        self.surname = surname
        self.name = name
        self.tel = tel
        self.post = post
//        self.titel = titel
//        self.quantity = quantity
//        self.price = price
//        self.profit = profit
        
        //self.isTrue = isTrue
    }
    
    func toAnyObject() -> Any {
        return [
            //"id": id,
            "surname": surname,
            "name": name,
            "tel": tel,
            "post": post,
//            "titel": titel,
//            "quantity": quantity,
//            "price": price,
//            "profit": profit,
            
            //"isTrue": isTrue
        ]
    }
}
