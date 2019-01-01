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
    
    let worker = FireBaseWorker()
    
    @IBOutlet var surnameField: UITextField!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var telField: UITextField!
    @IBOutlet var postField: UITextField!
    @IBOutlet var commentField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .clear
        setupNavigationBar()
        
    }
    
    func setupNavigationBar() {
    navigationController?.navigationBar.barTintColor = .white
    }
    
    @objc func back() {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        worker.saveDataSales(surname: surnameField.text!, name: nameField.text!, tel: telField.text!, post: postField.text!)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}


