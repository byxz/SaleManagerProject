//
//  MainBase.swift
//  SaleManager
//
//  Created by Mac on 08.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import Firebase

struct MainBase {
    
    let ref: DatabaseReference?
    let key: String
    let titel: String
    let quantity: Int
    let price: String
    let image: String
    //var isTrue: Bool
    
    init(titel: String, quantity: Int, price: String, image: String, key: String = "") {
        self.ref = nil
        self.key = key
        self.titel = titel
        self.quantity = quantity
        self.price = price
        self.image = image
        //self.isTrue = isTrue
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let titel = value["titel"] as? String,
            let quantity = value["quantity"] as? Int,
            let price = value["price"] as? String,
            let image = value["image"] as? String
            //let isTrue = value["isTrue"] as? Bool
            else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.titel = titel
        self.quantity = quantity
        self.price = price
        self.image = image
        //self.isTrue = isTrue
    }
    
    func toAnyObject() -> Any {
        return [
            "titel": titel,
            "quantity": quantity,
            "price": price,
            "image": image,
            //"isTrue": isTrue
        ]
    }
}
