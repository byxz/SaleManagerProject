//
//  NewSaleController.swift
//  SaleManager
//
//  Created by Mac on 12.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class NewSaleController: UITableViewController {
    
    let ref = Database.database().reference(withPath: "sales")
    
    @IBOutlet var surnameField: UITextField!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var telField: UITextField!
    @IBOutlet var postField: UITextField!
    @IBOutlet var commentField: UITextField!
    
   
    
    
    
    
    @IBAction func saveAction(_ sender: Any) {
      
            let groceryItem = Sales(surname: surnameField.text!, name: nameField.text!, tel: telField.text!, post: postField.text!)
            
        let groceryItemRef = self.ref.child(surnameField.text!.lowercased())
            
            groceryItemRef.setValue(groceryItem.toAnyObject())
        }
    
    
    
    
}


