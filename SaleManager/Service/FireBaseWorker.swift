//
//  FireBaseWorker.swift
//  SaleManager
//
//  Created by Mac on 05.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

class FireBaseWorker {
    
    var catalog = [MainBase]()
    var sales = [Sales]()
    var sections = [TableSection<Int, Sales>]()
    
    let catalogRef = Database.database().reference(withPath: "catalog")
    let salesRef = Database.database().reference(withPath: "sales")
    
    func userCheck() {
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                Status.shared.loginStatus = true
                print("TabBar Логин получен")
            } else {
                print("TabBar Пользователя с таким логином нет, идем на регистрацию")
                Status.shared.loginStatus = false
            }
            if let user = user {
                if user.email == "user@gmail.com" {
                    print("admin")
                }
            }
        }
    }
    
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
    
    func chartDB() {
        catalogRef.observe(.value, with: { snapshot in
            for item in snapshot.children {
                print(item)
            }
        })
        
    }
    
    func getDataSales(tableView: UITableView){
        salesRef.observe(.value, with: { snapshot in
            var newItems: [Sales] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let allItem = Sales(snapshot: snapshot) {
                    newItems.append(allItem)
                }
            }
            self.sales = newItems
            self.sections = TableSection.group(rowItems: self.sales, by: { (headline) in
                return headline.invoiceNumber
            })
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
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            Status.shared.loginStatus = false
            print("Вы вышли")
        } catch (let error) {
            print("Auth sign out failed: \(error)")
        }
    }
    
    
    
    func getData() {
        
        salesRef.observe(.value, with: { snapshot in
            var newItems: [Sales] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let allItem = Sales(snapshot: snapshot) {
                    newItems.append(allItem)
                    print(allItem.key)
                }
            }
        })
    }
    
}
