//
//  FireBaseWorker.swift
//  SaleManager
//
//  Created by Mac on 05.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FireBaseWorker {
    
    var catalog = [MainBase]()
    var sales = [Sales]()
    
    let catalogRef = Database.database().reference(withPath: "catalog")
    let salesRef = Database.database().reference(withPath: "sales")
    
    func getDataCatalog(tableView: UITableView) {
        catalogRef.observe(.value, with: { snapshot in
            var newItems: [MainBase] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let allItem = MainBase(snapshot: snapshot) {
                    newItems.append(allItem)
                }
            }
            self.catalog = newItems
            tableView.reloadData()
        })
        
    }
    
    func getDataSales(tableView: UITableView) {
        salesRef.observe(.value, with: { snapshot in
            var newItems: [Sales] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let allItem = Sales(snapshot: snapshot) {
                    newItems.append(allItem)
                }
            }
            self.sales = newItems
            tableView.reloadData()
        })
        
    }
    
    func saveDataSales(surname: String, name: String, tel: String, post: String) {

        let data = ["surname": surname, "name": name, "tel": tel, "post": post]
        let timeStamp = Int(NSDate.timeIntervalSinceReferenceDate*1000)
        self.salesRef.child("\(timeStamp)").setValue(data)
    
    }
    
    func deletDataSales(indexPath: IndexPath) {
        let indexPath = indexPath
        let groceryItem = sales[indexPath.row]
        groceryItem.ref?.removeValue()
    }
    
}
