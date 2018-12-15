//
//  SalesListController.swift
//  SaleManager
//
//  Created by Mac on 15.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import UIKit


class SalesListController: UIViewController {
    
    let worker = FireBaseWorker()
    
    @IBOutlet var mainTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worker.getDataSales(tableView: mainTable)
        
    }
    
    
    
}

extension SalesListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worker.sales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = worker.sales[indexPath.row].name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    
}
